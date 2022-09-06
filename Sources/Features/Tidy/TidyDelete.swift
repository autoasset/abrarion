//
//  File.swift
//  
//
//  Created by linhey on 2022/7/21.
//

import Stem
import Foundation
import StemFilePath
import Logging

public struct TidyDelete: MissionInstance {
    public var logger: Logger?
    
    public struct Options {
        var inputs: [STPath]
        let filter_patterns: [NSRegularExpression]
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            if let array = json.array?.compactMap(\.string) {
                self.inputs = try await variables.parse(array).map(STPath.init)
            } else {
                self.inputs = try await variables.parse(json["inputs"].arrayValue.map(\.stringValue)).map(STPath.init)
            }
            self.filter_patterns = try await variables.parse(json["filter_patterns"].arrayValue.map(\.stringValue)).map({ try NSRegularExpression(pattern: $0) })
        }
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        for input in options.inputs {
            switch input.referenceType {
            case .file(let file):
                try file.delete()
                logger?.info(.init(stringLiteral: file.relativePath(from: AppInfo.shared.pwd)))
            case .folder(let folder):
                if options.filter_patterns.isEmpty {
                    try folder.delete()
                    logger?.info(.init(stringLiteral: folder.relativePath(from: AppInfo.shared.pwd)))
                } else {
                    for path in try folder.subFilePaths() {
                        let name  = path.attributes.name
                        let range = NSRange(name.startIndex..<name.endIndex, in: name)
                        let flag = options.filter_patterns.contains { regex in
                            guard let result = regex.firstMatch(in: name, range: range) else {
                                return false
                            }
                            return result.range == range
                        }
                        if flag {
                            try path.delete()
                            logger?.info(.init(stringLiteral: path.relativePath(from: AppInfo.shared.pwd)))
                        }
                    }
                }
            case .none:
                break
            }
        }
    }
    
    public init() {}
    
}
