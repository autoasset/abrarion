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

public struct FlutterImageMaker: MissionInstance, XCMaker {
    
    public struct Options {
        
        let pubspec: STFile
        let output_resources_path: STFolder
        let template: FlutterCodeOptions
        let inputs: XCInputsOptions

        public init(from json: JSON, variables: VariablesManager) async throws {
            self.inputs   = try await XCInputsOptions(from: json, variables: variables)
            self.template = try await FlutterCodeOptions(from: json["template"], variables: variables)
            self.pubspec  = try await STFile(variables.parse(json["pubspec"].stringValue))
            guard json["output_resources_path"].isExists else {
                throw StemError("FlutterImageMaker: 未包含必要参数 output_resources_path")
            }
            self.output_resources_path = STFolder(try await variables.parse(json["output_resources_path"].stringValue))
        }
        
    }
    
    public var logger: Logger?
    
    public init() {}
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let vaild_files = try await XCInputFileManager(options.inputs).vaild_files()
                
        let images = options.output_resources_path.folder(name: "images")
        
        let marked = XCImageMark.marked(vaild_files)
        let maxScale = marked.keys.compactMap { kind -> Int? in
            switch kind {
            case .scale(let scale), .gif(let scale):
                return scale
            default:
                return nil
            }
        }.max()
        
       try marked.forEach { item in
            switch item.key {
            case .scale(let scale), .gif(let scale):
                let folder = images.folder(name: density(from: scale))
                _ = try? folder.create()
                try item.value.forEach { file in
                    try file.replace(folder.file(name: XCImageMark.filename(noScaleFactor: file)))
                }
            case .unrecognisedGIFScale:
                guard let scale = maxScale else {
                    return
                }
                let folder = images.folder(name: self.density(from: scale))
                _ = try? folder.create()
                try item.value.forEach { file in
                    try file.replace(folder.file(name: XCImageMark.filename(noScaleFactor: file)))
                }
            case .android_vector, .vector, .unrecognisedScale, .unknown:
                break
            }
        }
        
        let prefix = images.relativePath(from: options.pubspec)
        let store = try images
            .allSubFilePaths()
            .compactMap(\.asFile)
            .dictionary(key: \.attributes.name)
            .map { row -> String in
                let name = FlutterVariable.parse(name: row.value.attributes.nameComponents.name, option: options.template)
                return "static final \(name) = Image.asset('\(prefix)/\(row.value.attributes.name)',package: '\(options.template.package_name)');"
            }
            .sorted()
            .joined(separator: "\n")
        
        let code = """
        import 'package:flutter/material.dart';
        /// Created by abrarion(\(AppInfo.shared.version))
        class \(options.template.class_name) {
        \(store)
        }
        """
        
        try options.template.output?.overlay(with: code.data(using: .utf8))
    }
    
    private func density(from scale: Int) -> String {
        return "\(scale).0x"
    }

}
