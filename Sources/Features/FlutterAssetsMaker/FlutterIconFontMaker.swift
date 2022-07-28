//
//  File.swift
//  
//
//  Created by linhey on 2022/6/30.
//

import Foundation
import Stem
import StemFilePath
import Logging

public struct FlutterIconFontMaker: MissionInstance, XCMaker {
    public var logger: Logger?
    
    public init() {}
    
    public struct Options {
        let template: FlutterCodeOptions?
        let input: STFile
        let output: STFile
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.template = try await .init(from: json["template"], variables: variables)
            self.input  = STFile(try await variables.parse(json["input"].stringValue))
            self.output = STFile(try await variables.parse(json["output"].stringValue))
        }
    }
        
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let decoder = JSONDecoder()
        let model = try decoder.decode(KhalaIconFont.self, from: options.input.data())
        if let template = options.template {
            try await CodeMaker(file: options.output, records: model, options: template, variables: context.variables).evaluate()
        }
    }
    
}

extension FlutterIconFontMaker {
    
    struct CodeMaker {
        
        let file: STFile
        let records: KhalaIconFont
        let options: FlutterCodeOptions
        let variables: VariablesManager
        
        func evaluate() async throws {
            try file.delete()
            try await file.create(with: variables.parse(`extension`).data(using: .utf8))
        }
        
        private func code(with record: KhalaIconFont.Glyph) -> String {
            let name = FlutterVariable.parse(name: record.name, option: options)
            let code = "static const IconData \(name) = const IconData(0x\(record.unicode), fontFamily: '\(records.font_family)',fontPackage: '\(options.package_name)');"
            return code
        }
        
        private var `extension`: String {
        """
        import 'package:flutter/widgets.dart';
        /// Created by abrarion(\(AppInfo.shared.version))
        class \(options.class_name) {
        \(records.glyphs.map(code(with:)).sorted().joined(separator: "\n"))
        }
        """
        }
        
    }
    
}

