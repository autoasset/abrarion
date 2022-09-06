//
//  File.swift
//  
//
//  Created by linhey on 2022/7/19.
//

import Stem
import Foundation
import StemFilePath
import Logging

public struct TidyCopy: MissionInstance {
    
    public var logger: Logger?
    
    public struct Options {
        var inputs: [STPath]
        var output: STPath
        let filter_patterns: [NSRegularExpression]
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            if let item = json["inputs"].string {
                self.inputs = [STPath(try await variables.parse(item))]
            } else {
                self.inputs = try await variables.parse(json["inputs"].arrayValue.map(\.stringValue))
                    .map(STPath.init)
            }
            self.filter_patterns = try await variables.parse(json["filter_patterns"].arrayValue.map(\.stringValue))
                .map({ try NSRegularExpression(pattern: $0) })
            self.output = try await STPath(variables.parse(json["output"].stringValue))
        }
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        logger?.info(.init(stringLiteral: options.output.relativePath(from: AppInfo.shared.pwd)))
        for input in options.inputs {
            switch input.referenceType {
            case .file(let file):
                if options.output.attributes.name.contains(".") {
                    let to = STFile(options.output.url)
                       try to.overlay(with: file.data())
                } else {
                    try file.copy(into: STFolder(options.output.url), isOverlay: true)
                }
            case .folder(let folder):
                try folder.subFilePaths().forEach({ path in
                    try path.copy(into: STFolder(options.output.url), isOverlay: true)
                })
            case .none:
                break
            }
        }
    }
    
    public init() {}

}
