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

public struct TidyDelete: MissionInstance {
    public var logger: Logger?
    
    public struct Options {
        var inputs: [STPath]
        let patterns: [NSRegularExpression]
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            if let array = json.array?.compactMap(\.string) {
                self.inputs = try await variables.parse(array).map(STPath.init)
            } else {
                self.inputs = try await variables.parse(json["inputs"].arrayValue.map(\.stringValue)).map(STPath.init)
            }
            self.patterns = try await variables.parse(json["patterns"].arrayValue.map(\.stringValue)).map({ try NSRegularExpression(pattern: $0) })
        }
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        for input in options.inputs {
            switch input.referenceType {
            case .file(let file):
                try file.delete()
            case .folder(let folder):
                if options.patterns.isEmpty {
                    try folder.delete()
                } else {
                    for path in try folder.subFilePaths() {
                        let name  = path.attributes.name
                        let range = NSRange(name.startIndex..<name.endIndex, in: name)
                        let flag = options.patterns.contains { regex in
                            guard let result = regex.firstMatch(in: name, range: range) else {
                                return false
                            }
                            return result.range == range
                        }
                        if flag {
                            try path.delete()
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

public struct TidyCreate: MissionInstance {
    public var logger: Logger?
    
    public enum CreateInput {
        case text(String)
        case input(STFile)
    }
    
    public struct Options {
        public let input: CreateInput
        var output: STFile
        
        init(from json: JSON, variables: VariablesManager) async throws {
            output = try await STFile(variables.parse(json["output"].stringValue))
            if let item = json["input"].string {
                input = .input(STFile(try await variables.parse(item)))
            } else if let item = json["text"].string {
                input = .text(try await variables.parse(item))
            } else {
                throw StemError(message: "TidyCreate: 参数解析错误")
            }
        }
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let data: Data?
        switch options.input {
        case .input(let file):
            if let text = String(data: try file.data(), encoding: .utf8) {
                data = try await context.variables.parse(text).data(using: .utf8)
            } else {
                data = .init()
            }
        case .text(let text):
            data = try await context.variables.parse(text).data(using: .utf8)
        }
        try options.output.overlay(with: data)
    }
    
    public init() {}
}

public class Tidy {
    
    public struct CopyDeleteOptions {
        var inputs: [STPath]
        var output: STFolder
        let patterns: [NSRegularExpression]
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            if let array = json.array?.compactMap(\.string) {
                self.inputs = try await variables.parse(array).map(STPath.init)
            } else {
                self.inputs = try await variables.parse(json["inputs"].arrayValue.map(\.stringValue)).map(STPath.init)
            }
            self.patterns = try await variables.parse(json["patterns"].arrayValue.map(\.stringValue)).map({ try NSRegularExpression(pattern: $0) })
            self.output = try await STFolder(variables.parse(json["output"].stringValue))
        }
    }
    

    
}

extension Tidy {
    
    public func copy(options: CopyDeleteOptions) async throws {
        for input in options.inputs {
            switch input.referenceType {
            case .file(let file):
                let desURL = options.output.url.appendingPathComponent(file.url.lastPathComponent)
                let path = STPath(desURL)
                if path.isExist {
                    try path.delete()
                }
                try file.copy(into: options.output)
            case .folder(let folder):
                try folder.subFilePaths().forEach({ path in
                    let desURL = options.output.url.appendingPathComponent(path.url.lastPathComponent)
                    let path = STPath(desURL)
                    if path.isExist {
                        try path.delete()
                    }
                    try path.copy(into: folder)
                })
            case .none:
                break
            }
        }
    }
    
}
