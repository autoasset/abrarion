//
//  File.swift
//  
//
//  Created by linhey on 2022/7/20.
//

import Foundation
import Stem
import Logging
import StemFilePath

public struct FlutterImageCodeMaker: MissionInstance, XCMaker {
    
    public struct Options {
        
        let pubspec: STFile
        let output: STFile
        let inputs: [STFolder]
        let template: FlutterCodeOptions
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.inputs   = try await variables.parse(json["inputs"].arrayValue.compactMap(\.string)).map(STFolder.init)
            self.template = try await .init(from: json["template"], variables: variables)
            self.output   = STFile(try await variables.parse(json["output"].stringValue))
            self.pubspec  = STFile(try await variables.parse(json["pubspec"].stringValue))
        }
        
    }
    
    public var logger: Logger?
    
    public init() {}
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let channels = try options.inputs
            .map({ try $0.allSubFilePaths().compactMap(\.asFile) })
        
        let prefix: String
        
        if let first = options.inputs.first?.path {
           let icon = options.inputs
                .reduce(first, { $0.commonPrefix(with: $1.path) })
            let common = icon.commonPrefix(with: options.pubspec.path)
            prefix = String(icon.dropFirst(common.count))
        } else {
            prefix = ""
        }
        
        let store = channels
            .flatMap({ $0 })
            .dictionary(key: \.attributes.name)
            .map { row in
                "static const AssetImage \(row.value.attributes.nameComponents.name) = const Image.asset('\(prefix)\(row.value.attributes.name)');"
            }
            .sorted()
            .joined(separator: "\n")
        
        
       let code = """
        import 'package:flutter/material.dart';
        /// Created by abrarion
        class \(options.template.class_name) {
        \(store)
        }
        """
        
        try options.output.overlay(with: code.data(using: .utf8))
    }
    
}
