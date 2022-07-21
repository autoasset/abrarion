//
//  File.swift
//  
//
//  Created by linhey on 2022/6/30.
//

import Stem
import StemFilePath
import Logging

public struct XCDataMaker: MissionInstance, XCMaker {
    public var logger: Logger?
    
    public init() {}
    
    public struct Options {
        
        var template: XCCodeOptions?
        /// 依赖代码输出文件夹位置
        var template_dependent_output: String
        var contents: [String]
        var input_file_lints: [XCFileLint]
        var inputs: [String]
        var output: String
        
        internal init(template: XCCodeOptions?,
                      template_dependent_output: String,
                      contents: [String],
                      input_file_lints: [XCFileLint],
                      inputs: [String],
                      output: String) {
            self.template = template
            self.template_dependent_output = template_dependent_output
            self.input_file_lints = input_file_lints
            self.contents = contents
            self.inputs = inputs
            self.output = output
        }
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.template = try await .init(from: json["template"], default: .init(type: "Data"), variables: variables)
            
            var lints = [XCFileLint]()
            for json in json["input_file_lints"].arrayValue {
                if let item = try await XCFileLint(from: json, variables: variables) {
                    lints.append(item)
                }
            }
            self.input_file_lints = lints
            
            if let item = json["inputs"].string {
                self.inputs = [try await variables.parse(item)]
            } else {
                self.inputs = try await variables.parse(json["inputs"].arrayValue.compactMap(\.string))
            }
            
            if let item = json["contents"].string {
                self.contents = [try await variables.parse(item)]
            } else {
                self.contents = try await variables.parse(json["contents"].arrayValue.compactMap(\.string))
            }
            
            self.output = try await variables.parse(json["output"].stringValue)
            
            if self.template == nil {
                self.template_dependent_output = ""
            } else {
                if let path = json["template_dependent_output"].string {
                    self.template_dependent_output = try await variables.parse(path)
                } else {
                    throw StemError(message: "参数缺失: template_dependent_output")
                }
            }
        }
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        try await evaluate(options: try .init(from: json, variables: context.variables))
    }
    
    public func evaluate(options: Options) async throws {
        let contents = try await files(from: options.contents)
            .compactMap({ try? Content(from: $0) })
            .dictionary(key: \.filename)
        
        let folder = STFolder(options.output)
        
        let records = try await files(from: options.inputs)
            .compactMap { XCReport.shared.illegalFileName($0, with: options.input_file_lints) }
            .compactMap({ try? DataRecord(from: $0) })
            .reduce([String: [DataRecord]](), { result, record in
                var result = result
                if result[record.name] == nil {
                    result[record.name] = [record]
                } else {
                    result[record.name]! += [record]
                }
                return result
            })
            .map({ AssetsRecord(name: $0.key, datas: $0.value, contents: contents[$0.key]) })
            .map(XCReport.shared.vaild(_:))
            .compactMap({ record in
                try record.create(in: folder)
            })
        
        if let codeOptions = options.template {
            try XCDependentCodeMaker.createFindModule(in: .init(options.template_dependent_output))
            try CodeMaker(records: records, options: codeOptions).evaluate()
        }
    }
    
}

extension XCDataMaker {
    
    struct AssetsRecord {
        /// 变量名
        let name: String
        let datas: [DataRecord]
        let contents: Content?
        
        func asset() -> XCAsset<XCData>? {
            if let contents = contents {
                let set = Set(contents.asset.contents.compactMap(\.filename)).subtracting(Set(datas.map(\.file.attributes.name)))
                guard set.isEmpty else {
                    XCReport.shared.add(.contentsNoIncludedRequiredFiles(payload: .init(contents: contents.filename,
                                                                                        missingFiles: .init(set))))
                    return nil
                }
                return contents.asset
            }
            return .init(contents: datas.map(\.data), properties: .default)
        }
        
        func create(in folder: STFolder) throws -> Self? {
            guard let contents = asset() else {
                return nil
            }
            let folder = folder.folder(name: name + ".dataset")
            try folder.delete()
            try folder.create()
            try folder.create(file: "Contents.json", data: contents.data)
            try datas.forEach { record in
                try record.file.copy(into: folder)
            }
            return self
        }
        
    }
    
    struct DataRecord {
        /// 文件名
        let name: String
        let file: STFile
        let data: XCData
        
        init(from file: STFile) throws {
            self.file = file
            self.data = XCData(filename: file.attributes.nameComponents.filename)
            self.name = file.attributes.nameComponents.name
        }
    }
    
    struct Content {
        let filename: String
        let asset: XCAsset<XCData>
        
        init(from file: STFile) throws {
            self.filename = file.attributes.nameComponents.name
            self.asset = try .init(from: JSON(file.data()))
        }
    }
    
}

private extension XCDataMaker {
    
    struct CodeMaker {
        
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
            let mark = "/*\(named) bundle: \(options.bundle_name) */"
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
        
        @available(iOS 9.0, macOS 10.11, tvOS 6.0, watchOS 2.0, *)
        public func value() -> Foundation.Data {
            guard let bundle = bundle,
                  let data = NSDataAsset(name: named, bundle: Bundle.module(name: bundle))?.data else {
                    \(#"assertionFailure("can't find image: \(named) in: \(bundle ?? "main")")"#)
                    return Foundation.Data()
            }
            return data
        }
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
