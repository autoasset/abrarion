//
//  File.swift
//  
//
//  Created by linhey on 2022/7/26.
//

import Foundation
import Stem
import StemFilePath
import Logging

public struct FlutterColorMaker: MissionInstance, XCMaker {
    
    public var logger: Logger?
    
    public init() {}
    
    public struct Options {
        
        let inputs: [String]
        let output_light: STFile
        let output_dark: STFile?
        let template_light: FlutterCodeOptions
        let template_dark: FlutterCodeOptions?
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.output_light = try await STFile(variables.parse(json["output_light"].stringValue))
            self.template_light = try await .init(from: json["template_light"], variables: variables)
            if let item = json["output_dark"].string {
                self.output_dark = try await STFile(variables.parse(item))
                self.template_dark = try await .init(from: json["template_dark"], variables: variables)
            } else {
                self.output_dark = nil
                self.template_dark = nil
            }
            
            if let item = json["inputs"].string {
                self.inputs = [try await variables.parse(item)]
            } else {
                self.inputs = try await variables.parse(json["inputs"].arrayValue.compactMap(\.string))
            }
        }
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let records = try await XCColorMaker().records(options.inputs)
        
        let light = records.map { record -> [String] in
            let color = record.any.hexString(.digits8, prefix: .bits)
            return record.names.map { name in
                let name = FlutterVariable.parseColor(name: name, option: options.template_light)
                return "static const \(name) = Color(\(color));"
            }
        }
            .joined()
            .sorted()
            .joined(separator: "\n")
        
        let dark = records.map { record -> [String] in
            let colorValue = record.dark ?? record.any
            let color = colorValue.hexString(.digits8, prefix: .bits)
            return record.names.map { name in
                var name = name
                if let template = options.template_dark {
                    name = FlutterVariable.parseColor(name: name, option: template)
                }
                return "static const \(name) = Color(\(color));"
            }
        }
            .joined()
            .sorted()
            .joined(separator: "\n")
        
        try options.output_light.overlay(with:
        """
        import 'dart:ui';
        /// Created by abrarion(\(AppInfo.shared.version))
        class \(options.template_light.class_name) {
        \(light)
        }
        """.data(using: .utf8))
        
        if let template = options.template_dark {
            try options.output_dark?.overlay(with:
             """
             import 'dart:ui';
             /// Created by abrarion(\(AppInfo.shared.version))
             class \(template.class_name) {
             \(dark)
             }
             """.data(using: .utf8))
        }
        
    }
    
}
