//
//  File.swift
//  
//
//  Created by linhey on 2022/6/30.
//

import Stem
import StemFilePath
import Foundation
import Logging

public struct XCIconFontMaker: MissionInstance, XCMaker {
    
    public var logger: Logger?
    public init() {}
    
    public struct Options {
        
        var dataOptions: XCDataMaker.Options
        let input_json: STFile
        let input_font: STFile
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.input_json  = STFile(try await variables.parse(json["input_json"].stringValue))
            self.input_font  = STFile(try await variables.parse(json["input_font"].stringValue))
            self.dataOptions = try await .init(from: json, variables: variables)
            self.dataOptions.inputs = [self.input_font.path]
            self.dataOptions.contents = []
        }
        
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        try await evaluate(options: try .init(from: json, variables: context.variables), context: context)
    }
    
    public func evaluate(options: Options, context: MissionContext) async throws {
        let decoder = JSONDecoder()
        let model = try decoder.decode(KhalaIconFont.self, from: options.input_json.data())
        
        var dataOptions = options.dataOptions
        dataOptions.template = nil
        try await XCDataMaker().evaluate(options: dataOptions)
        
        if let template = options.dataOptions.template {
            try await CodeMaker(font: options.input_font,
                                records: model,
                                options: template,
                                variables: context.variables).evaluate()
        }
        
    }
    
}


extension XCIconFontMaker {
    
    struct CodeMaker {
        
        let font: STFile
        let records: KhalaIconFont
        let options: XCCodeOptions
        let variables: VariablesManager
        
        func evaluate() async throws {
            let file = STFile(options.instance_output_path)
            try file.delete()
            try file.create(with: instance.data(using: .utf8))
            let list = STFile(options.list_output_path)
            try list.delete()
            try list.create(with: `extension`.data(using: .utf8))
        }
        
        private func code(with record: KhalaIconFont.Glyph) -> String {
            let named = record.name
            let formatter = NameFormatter(language: .swift, splitSet: .letters.union(.decimalDigits).inverted)
            let name = formatter.camelCased(named)
            return "/*\(named) bundle: \(options.bundle_name) */"
            + "\n var \(name): \(options.instance_name) { "
            + #".init(string: "\u{"#
            + record.unicode
            + #"}", in: ""#
            + options.bundle_name
            + #"", familyName: ""#
            + records.font_family
            + #"", dataName: ""#
            + formatter.camelCased(font.attributes.nameComponents.name)
            + #"") }"#
        }
        
        private var `extension`: String {
            """
            public extension \(options.list_protocol_name) {
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
    
    public protocol \(options.instance_protocol_name) {
        var dataName: String { get }
        var bundle: String { get }
        var string: String { get }
        var familyName: String { get }
        init(string: String, in bundle: String, familyName: String, dataName: String)
    }
    
    public extension \(options.instance_protocol_name) {
        
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
    
    extension \(options.instance_protocol_name) {
    
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
    
    public protocol \(options.list_protocol_name) {}
    
    public struct \(options.instance_name): \(options.instance_protocol_name) {
        
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
