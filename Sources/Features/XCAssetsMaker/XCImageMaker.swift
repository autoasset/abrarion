//
//  File.swift
//  
//
//  Created by linhey on 2022/6/20.
//

import Foundation
import Stem
import StemFilePath

public struct XCImageMaker: MissionInstance, XCMaker {
    
    public struct JSONModeOptions {
        fileprivate let template: XCCodeOptions?
        fileprivate let vector_template: XCCodeOptions?
        /// 依赖代码输出文件夹位置
        fileprivate let template_dependent_output: String
        fileprivate let input_file_lints: [XCFileLint]
        fileprivate let contents: [String]
        fileprivate let inputs: [String]
        fileprivate let output: String
        
        public init(from json: JSON) throws {
            self.template = try .init(from: json["template"], default: .init(type: "Image"))
            self.vector_template = try .init(from: json["vector_template"], default: .init(type: "VectorImage"))
            
            self.contents = json["contents"].arrayValue.compactMap(\.string)
            self.inputs = json["inputs"].arrayValue.compactMap(\.string)
            self.output = json["output"].stringValue
            self.input_file_lints = json["input_file_lints"].arrayValue.compactMap(XCFileLint.init(from:))
            
            if self.template == nil, self.vector_template == nil {
                self.template_dependent_output = ""
            } else {
                if let path = json["template_dependent_output"].string {
                    self.template_dependent_output = path
                } else {
                    throw StemError(message: "参数缺失: template_dependent_output \(#file) - \(#function) - \(#line)")
                }
            }
        }
    }
    
    public func evaluate(from json: JSON?) async throws {
        guard let json = json else {
            return
        }
        try await evaluate(options: try .init(from: json))
    }
    
    public func evaluate(options: JSONModeOptions) async throws {
        
        let contents = try await files(from: options.contents)
            .compactMap({ try? Content(from: $0) })
            .dictionary(key: \.filename)
        
        let folder = STFolder(options.output)
        
        let records = try await files(from: options.inputs)
            .compactMap { XCReport.shared.illegalFileName($0, with: options.input_file_lints) }
            .compactMap({ try? ImageRecord(from: $0) })
            .reduce([String: [ImageRecord]](), { result, record in
                var result = result
                if result[record.name] == nil {
                    result[record.name] = [record]
                } else {
                    result[record.name]! += [record]
                }
                return result
            })
            .map({ AssetsRecord(name: $0.key, images: $0.value, contents: contents[$0.key]) })
            .map(XCReport.shared.vaild(_:))
            .compactMap({ record in
                try record.create(in: folder)
            })
        
        if let codeOptions = options.template {
            try XCDependentCodeMaker.createFindModule(in: .init(options.template_dependent_output))
            try CodeMaker(isVector: false, records: records.filter({ record in
                record.asset()?.properties.renderAs != .template
            }), options: codeOptions).evaluate()
        }
        
        if let codeOptions = options.vector_template {
            try XCDependentCodeMaker.createFindModule(in: .init(options.template_dependent_output))
            try CodeMaker(isVector: true, records: records.filter({ record in
                record.asset()?.properties.renderAs == .template
            }), options: codeOptions).evaluate()
        }
        
    }
    
    public init() {}
    
}

private extension XCImageMaker {
    
    struct ImageContentsNoIncludedRequiredFiles: XCReportPayload {
        static var Key: String = "image_contents_no_included_requiredFiles"
        static var Message: String = "图片描述文件验证错误 (描述文件中包含的文件名未在磁盘上找到)"
        let contents: String
        let missingFiles: [String]
    }
    
    struct ImageRedundantFiles: XCReportPayload {
        static var Key: String = "image_redundant_files"
        static var Message: String = "图片文件验证错误 (冗余图片)"
        let files: [String]
    }
    
}

extension XCImageMaker {
    
    struct AssetsRecord {
        /// 变量名
        let name: String
        let images: [ImageRecord]
        let contents: Content?
        
        func asset() -> XCAsset<XCImage>? {
            if let contents = contents {
                let set = Set(contents.asset.contents.compactMap(\.filename)).subtracting(Set(images.map(\.file.attributes.name)))
                guard set.isEmpty else {
                    XCReport.shared.add(ImageContentsNoIncludedRequiredFiles(contents: contents.filename, missingFiles: .init(set)))
                    return nil
                }
                return contents.asset
            }
            
            var renderDict = [XCImageRenderAs: [ImageRecord]]()
            images.forEach { record in
                if renderDict[record.renderAs] == nil {
                    renderDict[record.renderAs] = []
                }
                renderDict[record.renderAs]?.append(record)
            }
            
            if renderDict.count > 1 {
                XCReport.shared.add(ImageRedundantFiles(files: images.map(\.file.attributes.name)))
                return nil
            }
            
            if let images = renderDict[.template] {
                return .init(contents: images.map(\.image), properties: .init(renderAs: .template, preservesVectorRepresentation: true))
            }
            
            if let images = renderDict[.original] {
                return .init(contents: images.map(\.image), properties: .init(renderAs: .original, preservesVectorRepresentation: false))
            }
            
            return nil
        }
        
        func create(in folder: STFolder) throws -> Self? {
            guard let contents = asset() else {
                return nil
            }
            let folder = folder.folder(name: name + ".imageset")
            try folder.delete()
            try folder.create()
            try folder.create(file: "Contents.json", data: contents.data)
            try images.forEach { record in
                try record.file.copy(into: folder)
            }
            return self
        }
        
    }
    
    struct ImageRecord {
        /// 文件名
        let name: String
        let file: STFile
        let image: XCImage
        let renderAs: XCImageRenderAs
        
        init(from file: STFile) throws {
            guard let data = try? file.data() else {
                throw StemError(message: "无法读取文件内容: \(file.attributes.name)")
            }
            
            let scale: XCImageScale?
            let luminosity: Appearance.Luminosity?
            
            let name = file.attributes.name.lowercased()
            
            if name.hasSuffix(".svg"), StemSVG(data) != nil {
                renderAs = .template
                scale = nil
            } else if let type = data.st.mimeType {
                switch type {
                case .pdf:
                    renderAs = .template
                    scale = nil
                case .png, .jpeg:
                    renderAs = .original
                    if name.contains("@3x.") {
                        scale = .x3
                    } else if name.contains("@2x.") {
                        scale = .x2
                    } else if name.contains("@1x.") {
                        scale = .x1
                    } else {
                        scale = nil
                    }
                default:
                    throw StemError(message: "文件未被判断为图片格式: \(file.attributes.name)")
                }
            } else {
                throw StemError(message: "文件未被判断为图片格式: \(file.attributes.name)")
            }
            
            if ["_dark@", "_dark."].contains(where: { name.contains($0) }) {
                luminosity = .dark
            } else {
                luminosity = nil
            }
            
            self.file = file
            self.image = .init(filename: file.attributes.name,
                               appearances: luminosity.flatMap({ [Appearance.luminosity($0)] }) ?? [],
                               displayGamut: nil,
                               scale: scale,
                               locale: nil,
                               devices: .init(idiom: .universal),
                               direction: nil,
                               size: nil,
                               memory: nil)
            
            let filename = file.attributes.nameComponents.filename
            if let split = ["_dark@", "_dark.", "@3x.", "@2x.", "@1x.", "."].first(where: { filename.contains($0) }),
               let name = filename.components(separatedBy: split).first {
                self.name = name
            } else {
                self.name = filename
            }
        }
        
    }
    
    struct Content {
        let filename: String
        let asset: XCAsset<XCImage>
        
        init(from file: STFile) throws {
            self.filename = file.attributes.nameComponents.name
            self.asset = try .init(from: JSON(file.data()))
        }
    }
    
}


private extension XCImageMaker {
    
    struct CodeMaker {
        
        let isVector: Bool
        let records: [AssetsRecord]
        let options: XCCodeOptions
        
        func evaluate() throws {
            let file = STFile(options.instance_output_path)
            try file.delete()
            try file.create(with: instance.data(using: .utf8))
            
            let list = STFile(options.list_output_path)
            try list.delete()
            try list.create(with: `extension`.data(using: .utf8))
        }
        
        private func code(with record: AssetsRecord) -> String {
            let named = record.name
            let name = NameFormatter(language: .swift, splitSet: .letters.union(.decimalDigits).inverted).camelCased(named)
            let mark = "/*\(isVector ? "vector: " : ""): \(named) bundle: \(options.bundle_name) */"
            return "\(mark) \n var \(name): \(options.instance_name) { .init(named: \"\(named)\", in: \"\(options.bundle_name.isEmpty ? "nil" : options.bundle_name)\") }"
        }
        
        private var `extension`: String {
            """
            public extension \(options.list_protocol_name) {
            \(records.sorted(by: { $0.name < $1.name }).map(code(with:)).joined(separator: "\n"))
            }
            """
        }
        
        private var instance: String {
    """
    #if canImport(UIKit)
    import UIKit
    #elseif canImport(AppKit)
    import AppKit
    #endif
    
    public protocol \(options.instance_protocol_name) {
        
        var named: String { get }
        var bundle: String? { get }
        
        init(named: String, in bundle: String?)
    }
    
    extension \(options.instance_protocol_name) {
        
    #if canImport(UIKit)
        func value() -> UIImage {
            guard let name = bundle,
                  let image = UIImage(named: named, in: Bundle.module(name: name), compatibleWith: nil) else {
                guard let image = UIImage(named: named) else {
                    \(#"assertionFailure("can't find image: \(named) in: \(bundle ?? "main")")"#)
                    return UIImage()
                }
                return image
            }
            
            return image
        }
    #elseif canImport(AppKit)
        func value() -> NSImage {
            guard let name = bundle, let image = Bundle.module(name: name).image(forResource: named) else {
                guard let image = NSImage(named: named) else {
                    \(#"assertionFailure("can't find image: \(named) in: \(bundle ?? "main")")"#)
                    return NSImage()
                }
                return image
            }
            return image
        }
    #endif
        
    }
    
    public protocol \(options.list_protocol_name) {}
    
    public struct \(options.instance_name): \(options.instance_protocol_name) {
        
        public let named: String
        public let bundle: String?
    
        public init(named: String, in bundle: String?) {
            self.named = named
            self.bundle = bundle
        }
    
    }
    """
        }
        
        
    }
    
}
