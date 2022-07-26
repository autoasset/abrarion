//
//  File.swift
//  
//
//  Created by linhey on 2022/7/22.
//

import Foundation
import Stem
import StemFilePath
import Logging
import Yams

public struct FlutterPubspecMaker: MissionInstance {
    
    public var logger: Logger?
    
    public struct Options {
        let input: STFile
        
        let fonts: STFolder
        let images: STFolder
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.input  = STFile(try await variables.parse(json["input"].stringValue))
            self.fonts  = STFolder(try await variables.parse(json["fonts"].stringValue))
            self.images = STFolder(try await variables.parse(json["images"].stringValue))
        }
        
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        guard let text = try String(data: options.input.data(), encoding: .utf8),
              let yaml = try Yams.load(yaml: text) else {
            return
        }
        
        
        var json = JSON(yaml).dictionaryObject ?? [:]
        var flutter = json["flutter"] as? [String: Any] ?? [:]
        
        if options.fonts.isExist {
            let prefix = options.input.path.commonPrefix(with: options.fonts.path)
            let basePath = String(options.fonts.path.dropFirst(prefix.count))
            let files  = try options.fonts.allSubFilePaths().compactMap(\.asFile)
            if let first = files.first {
                let asset = basePath + "/" + first.attributes.name
                let family = files
                    .map(\.attributes.nameComponents.name)
                    .reduce(first.attributes.nameComponents.name, { $0.commonPrefix(with: $1) })
                flutter["fonts"] = [
                    [
                        "family": family,
                        "fonts": [
                            ["asset": asset]
                        ]
                    ]
                ]
            }
        }
        
        if options.images.isExist {
            let prefix  = options.input.path.commonPrefix(with: options.images.path)
            let basePath = String(options.images.path.dropFirst(prefix.count))
            flutter["assets"] = try options.images
                .allSubFilePaths()
                .compactMap(\.asFile?.attributes.name)
                .map({ basePath + "/" + $0 })
                .dictionary(key: \.description)
                .keys
                .sorted()
        }
        
        json["flutter"] = flutter
        let new = try Yams.dump(object: json, sortKeys: true)
        try options.input.overlay(with: new.data(using: .utf8))
    }
    
    public init() {}
    
}
