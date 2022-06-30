//
//  File.swift
//  
//
//  Created by linhey on 2022/6/30.
//

import Stem
import StemFilePath
import Foundation

public struct XCIconFontMaker: MissionInstance, XCMaker {
    
    public init() {}
    
    public struct JSONModeOptions {
        fileprivate let template: XCCodeOptions?
        /// 依赖代码输出文件夹位置
        fileprivate let template_dependent_output: String
        fileprivate let input_json_file: String
        fileprivate let input_font_file: String
        fileprivate let output: String
        
        public init(from json: JSON) throws {
            self.template = try .init(from: json["template"], default: .init(type: "IconFont"))
            
            self.input_json_file = json["input_json_file"].stringValue
            self.input_font_file = json["input_font_file"].stringValue
            self.output = json["output"].stringValue
            
            if self.template == nil {
                self.template_dependent_output = ""
            } else {
                if let path = json["template_dependent_output"].string {
                    self.template_dependent_output = path
                } else {
                    throw StemError(message: "参数缺失: template_dependent_output")
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
        let decoder = JSONDecoder()
        let iconFontFile = try STFile(options.input_json_file)
        let model = try decoder.decode(KhalaIconFont.self, from: iconFontFile.data())
        
        try await XCDataMaker().evaluate(options: .init(template: options.template,
                                                        template_dependent_output: options.template_dependent_output,
                                                        contents: [],
                                                        input_file_lints: [],
                                                        inputs: [options.input_font_file],
                                                        output: options.output))
        
        if let options = options.template {
            try CodeMaker(file: iconFontFile, records: model, options: options).evaluate()
        }
        
    }
    
}

extension XCIconFontMaker {
    
    struct CodeMaker {
        
        let file: STFile
        let records: KhalaIconFont
        let options: XCCodeOptions
        
        func evaluate() throws {
            let file = try STFile(options.instanceOutputPath)
            try file.delete()
            try file.create(with: instance.data(using: .utf8))
            
            let list = try STFile(options.listOutputPath)
            try list.delete()
            try list.create(with: `extension`.data(using: .utf8))
        }
        
        private func code(with record: KhalaIconFont.Glyph) -> String {
            let named = record.name
            let formatter = NameFormatter(language: .swift, splitSet: .letters.union(.decimalDigits).inverted)
            let name = formatter.camelCased(named)
            return "/*\(named) bundle: \(options.bundleName) */"
            + "\n var \(name): \(options.instanceName) {"
            + #".init(string: "\u{"#
            + record.unicode
            + #"}", in: ""#
            + options.bundleName
            + #"", familyName: ""#
            + records.font_family
            + #"", dataName: ""#
            + formatter.camelCased(file.attributes.nameComponents.name)
            + #"") }"#
        }
        
        private var `extension`: String {
            """
            public extension \(options.listProtocolName) {
            \(records.glyphs.sorted(by: { $0.name < $1.name }).map(code(with:)).joined(separator: "\n"))
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
    
    public protocol \(options.instanceProtocolName) {
        var dataName: String { get }
        var bundle: String { get }
        var string: String { get }
        var familyName: String { get }
        init(string: String, in bundle: String, familyName: String, dataName: String)
    }
    
    public extension \(options.instanceProtocolName) {
        
        #if canImport(AppKit)
        func font(ofSize: CGFloat) -> NSFont {
            return NSFont(name: familyName, size: ofSize) ?? .systemFont(ofSize: ofSize)
        }
        #elseif canImport(UIKit)
        func font(ofSize: CGFloat) -> UIFont {
            return UIFont(name: familyName, size: ofSize) ?? .systemFont(ofSize: ofSize)
        }
        #endif
    
        func attributedString(fontSize: CGFloat, attributes: [NSAttributedString.Key: Any] = [:]) -> NSAttributedString {
            var attributes = attributes
            attributes[.font] = font(ofSize: fontSize)
            return .init(string: string, attributes: attributes)
        }
    
    }
    
    extension \(options.instanceProtocolName) {
    
        @available(iOS 9.0, macOS 10.11, tvOS 6.0, watchOS 2.0, *)
        func data() -> Foundation.Data {
            guard let data = NSDataAsset(name: dataName, bundle: Bundle.module(name: bundle))?.data else {
                \(#"assertionFailure("can't find data: \(dataName) in bundle: \(bundle)")"#)
                return Foundation.Data()
            }
            return data
        }
        
        func register(data: Data) throws {
            guard let provider = CGDataProvider(data: data as CFData),
                  let font = CGFont(provider) else {
                return
            }
            
            var error: Unmanaged<CFError>?
            
            if CTFontManagerRegisterGraphicsFont(font, &error) == false, let error = error?.takeUnretainedValue() {
                throw error
            }
        }
        
        func isAvailable(familyName: String) -> Bool {
            #if canImport(AppKit)
            return NSFontManager.shared.availableFontFamilies.contains(familyName)
            #elseif canImport(UIKit)
            return !UIFont.fontNames(forFamilyName: familyName).isEmpty
            #else
            return false
            #endif
        }
    
    }
    
    public protocol \(options.listProtocolName) {}
    
    public struct \(options.instanceName): \(options.instanceProtocolName) {
        
        public let string: String
        public let bundle: String
        public let familyName: String
        public let dataName: String
        
        private static var registerMap = Set<String>()
        
        public init(string: String, in bundle: String, familyName: String, dataName: String) {
            self.string = string
            self.bundle = bundle
            self.familyName = familyName
            self.dataName = dataName
            
            if Self.registerMap.contains(familyName) {
                return
            }
            
            if isAvailable(familyName: familyName) == false {
                try? register(data: data())
                Self.registerMap.update(with: familyName)
            }
        }
    
    }
    """
        }
        
    }
    
}
