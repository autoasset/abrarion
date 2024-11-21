//
//  File.swift
//  
//
//  Created by linhey on 2022/6/20.
//

import Foundation
import Stem
import STJSON
import STFilePath
import Logging

public struct XCImageMaker: MissionInstance, XCMaker {
    
    public var logger: Logger?
    
    public struct JSONModeOptions {
        fileprivate let template: XCCodeOptions?
        fileprivate let vector_template: XCCodeOptions?
        fileprivate let vector_render_as: XCImageRenderAs?
        /// 依赖代码输出文件夹位置
        fileprivate let template_dependent_output: String
        fileprivate let contents: [String]
        fileprivate let output: String
        fileprivate let inputs: XCInputsOptions

        public init(from json: JSON, variables: VariablesManager) async throws {
            self.inputs   = try await XCInputsOptions(from: json, variables: variables)
            self.vector_render_as = .init(rawValue: try await variables.parse(json["vector_render_as"].stringValue))
            self.template = try await .init(from: json["template"], default: .init(type: "Image"), variables: variables)
            self.contents = try await variables.parse(json["contents"].stringArrayValue)
            self.output   = try await variables.parse(json["output"].stringValue)
            self.vector_template = try await .init(from: json["vector_template"], default: .init(type: "VectorImage"), variables: variables)
            
            if self.template == nil, self.vector_template == nil {
                self.template_dependent_output = ""
            } else {
                if let path = json["template_dependent_output"].string {
                    self.template_dependent_output = try await variables.parse(path)
                } else {
                    throw StemError(message: "参数缺失: template_dependent_output \(#file) - \(#function) - \(#line)")
                }
            }
        }
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        try await evaluate(options: try .init(from: json, variables: context.variables))
    }
    
    public func evaluate(options: JSONModeOptions) async throws {
        
        let contents = try await files(from: options.contents)
            .compactMap({ try? Content(from: $0) })
            .dictionary(key: \.filename)
        
        var usedContents = Set<STFile>()
        
        let folder = STFolder(options.output)
        
        let records = try await XCInputFileManager(options.inputs).vaild_files()
            // .compactMap { XCReport.shared.illegalFileName($0, with: options.file_tagss) }
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
            .map({ item -> AssetsRecord in
                if let content = contents[item.key] {
                    usedContents.update(with: content.file)
                    return AssetsRecord(name: item.key, images: item.value, contents: content, options: options)
                } else {
                    return AssetsRecord(name: item.key, images: item.value, contents: nil, options: options)
                }
            })
            .map(XCReport.shared.vaild(_:))
            .compactMap({ record in
                try record.create(in: folder)
            })
        
        XCReport.shared.unused_contents(Set(contents.values.map(\.file)).subtracting(usedContents))
        
        if let codeOptions = options.template {
            try XCDependentCodeMaker.createFindModule(in: .init(options.template_dependent_output))
            /// 是否合并矢量图
            let useTemplate = options.vector_template == nil
            try CodeMaker(isVector: false, records: records.filter({ record in
                if useTemplate {
                    return true
                } else {
                    return record.asset()?.properties.renderAs != .template
                }
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

extension XCImageMaker {
    
    struct AssetsRecord {
        /// 变量名
        let name: String
        let images: [ImageRecord]
        let contents: Content?
        let options: JSONModeOptions
        
        func asset() -> XCAsset<XCImage>? {
            if let contents = contents {
                let set = Set(contents.asset.contents.compactMap(\.filename)).subtracting(Set(images.map(\.file.attributes.name)))
                guard set.isEmpty else {
                    XCReport.shared.add(.contentsNoIncludedRequiredFiles(payload: .init(contents: contents.filename, missingFiles: .init(set))))
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
                XCReport.shared.add(.redundantFiles(payload: .init(files: images.map(\.file.attributes.name))))
                return nil
            }
            
            if let images = renderDict[.template] {
                return .init(contents: images.map(\.image),
                             properties: .init(renderAs: options.vector_render_as ?? .template,
                                               preservesVectorRepresentation: true))
            }
            
            if let images = renderDict[.original] {
                return .init(contents: images.map(\.image), 
                             properties: .init(renderAs: .original,
                                               preservesVectorRepresentation: false))
            }
            
            if let images = renderDict[.default] {
                return .init(contents: images.map(\.image),
                             properties: .init(renderAs: .default,
                                               preservesVectorRepresentation: false))
            }
            
            return nil
        }
        
        func create(in folder: STFolder) throws -> Self? {
            let folder = folder.folder(name + ".imageset")
            try folder.delete()
            try folder.create()
            images.forEach { record in
                do {
                    try record.file.copy(into: folder)
                } catch {
                    XCReport.shared.add(.error(payload: .init(message: error.localizedDescription)))
                }
            }
            
            if let contents = contents {
                try folder.create(file: "Contents.json", data: contents.file.data())
            } else if let contents = asset() {
                try folder.create(file: "Contents.json", data: contents.data)
            } else {
               return nil
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
        
        init?(from file: STFile) throws {
            var scale: XCImageScale?
            let luminosity: Appearance.Luminosity?
                        
            let name = file.attributes.name.lowercased()
            
            switch XCImageMark.marked(file) {
            case .unknown, .android_vector, .gif, .unrecognisedGIFScale:
                return nil
            case .vector:
                renderAs = .template
                scale = nil
            case .unrecognisedScale:
                renderAs = .default
                scale = nil
            case .scale(let value):
                renderAs = .default
                switch value {
                case 1: scale = .x1
                case 2: scale = .x2
                case 3: scale = .x3
                default:
                    return nil
                }
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
        let file: STFile
        let asset: XCAsset<XCImage>
        
        init(from file: STFile) throws {
            self.file = file
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
            return "\(mark) \n static var \(name): \(options.instance_name) { .init(named: \"\(named)\", in: \"\(options.bundle_name.isEmpty ? "nil" : options.bundle_name)\") }"
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
    
    public extension \(options.instance_protocol_name) {
        
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
    
    public struct \(options.instance_name): \(options.instance_protocol_name), \(options.list_protocol_name) {
        
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
