//
//  File.swift
//  
//
//  Created by linhey on 2022/6/30.
//

import Foundation
import Stem
import StemFilePath

public struct FlutterIconFontMarker: MissionInstance, XCMaker {
    
    public init() {}
    
    public struct CodeOptions {
        let font_package: String
        let class_name: String
        let list_output_path: String
        
        public init(from json: JSON) throws {
            self.font_package = json["font_package"].stringValue
            self.class_name = json["class_name"].stringValue
            self.list_output_path = json["list_output_path"].stringValue
        }
        
    }
    
    public struct JSONModeOptions {
        fileprivate let template: CodeOptions?
        fileprivate let input_json_file: String
        fileprivate let input_font_file: String
        fileprivate let output: String
        
        public init(from json: JSON) throws {
            self.template = try .init(from: json["template"])
            
            self.input_json_file = json["input_json_file"].stringValue
            self.input_font_file = json["input_font_file"].stringValue
            self.output = json["output"].stringValue
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
        let iconFontJsonFile = try STFile(options.input_json_file)
        let model = try decoder.decode(KhalaIconFont.self, from: iconFontJsonFile.data())
        
        let iconFontFile = try STFile(options.input_font_file)
        let folder = try STFolder(options.output)
        try? folder.create()
        
        try iconFontFile.copy(into: folder)
                
        if let options = options.template {
            try CodeMaker(file: iconFontFile, records: model, options: options).evaluate()
        }
        
    }
    
}

extension FlutterIconFontMarker {
    
    struct CodeMaker {
        
        let file: STFile
        let records: KhalaIconFont
        let options: CodeOptions
        
        func evaluate() throws {
            let list = try STFile(options.list_output_path)
            try list.delete()
            try list.create(with: `extension`.data(using: .utf8))
        }
        
        private func code(with record: KhalaIconFont.Glyph) -> String {
            let named = record.name
            let formatter = NameFormatter(language: .swift, splitSet: .letters.union(.decimalDigits).inverted)
            let name = formatter.camelCased(named)
            return "static const IconData \(name) = const IconData(0x\(record.unicode), fontFamily: '\(records.font_family)',fontPackage: '\(options.font_package)');"
        }
        
        private var `extension`: String {
        """
        import 'package:flutter/widgets.dart';
        
        class \(options.class_name) {
        
        \(records.glyphs.map(code(with:)).sorted().joined(separator: "\n"))
        
        }
        """
        }
        
    }
    
}

