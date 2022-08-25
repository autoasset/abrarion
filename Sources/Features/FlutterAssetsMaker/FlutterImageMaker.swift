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
        let inputs: [String]
        let template: FlutterCodeOptions
        let file_tags: XCFileTags?
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.inputs    = try await variables.parse(json["inputs"].arrayValue.compactMap(\.string))
            self.file_tags = try await XCFileTags(from: json, variables: variables)
            self.template  = try await FlutterCodeOptions(from: json["template"], variables: variables)
            self.pubspec   = STFile(try await variables.parse(json["pubspec"].stringValue))
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
        
        let vaild_files: Set<STFile>
        if let file_tags = options.file_tags {
            vaild_files = try await XCFileTagsManager(file_tags).vaild_files()
        } else {
            vaild_files = try await Set(files(from: options.inputs))
        }
        
        var channels = [Int: Set<STFile>]()
        
        for file in vaild_files {
            guard let channelStr = file
                .attributes.nameComponents.name
                .split(separator: "@")
                .last?
                .replacingOccurrences(of: "x", with: ""),
                  let channel = Int(channelStr) else {
                throw StemError("FlutterImageMaker: \(file.attributes.name) 未包含必要的倍率, 例如 xx@2x.jpg")
            }
            if channels[channel] == nil {
                channels[channel] = .init()
            }
            channels[channel]?.update(with: file)
        }
        
        let images = options.output_resources_path.folder(name: "images")
        try channels.forEach { item in
            let folder = images.folder(name: "\(item.key).0x")
            _ = try? folder.create()
            try item.value.forEach { file in
                let name = [
                    file.attributes.nameComponents.name
                        .split(separator: "@")
                        .dropLast()
                        .joined(separator: "@"),
                    file.attributes.nameComponents.extension
                ]
                    .compactMap({ $0 })
                    .joined(separator: ".")
                try file.replace(folder.file(name: name))
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
    
}
