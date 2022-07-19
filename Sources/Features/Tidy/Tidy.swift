//
//  File.swift
//  
//
//  Created by linhey on 2022/7/19.
//

import Stem
import Foundation
import StemFilePath

public class TidyDelete: Tidy, MissionInstance {
    
    public func evaluate(from json: JSON?, context: MissionContext) async throws {
        guard let json = json else {
            return
        }
        let option = try await CopyDeleteOptions(from: json, variables: context.variables)
        try await delete(options: option)
    }
    
    public override init() {
        super.init()
    }
    
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
    
    public enum CreateInput {
        case text(String)
        case input(STFile)
    }
    
    public struct CreateOptions {
        public let input: CreateInput
        var output: STFile
        
        init?(from json: JSON) {
            output = STFile(json["output"].stringValue)
            
            if let item = json["text"].string, item.isEmpty == false {
                input = .text(item)
            } else if let item = json["input"].string, item.isEmpty == false {
                input = .input(STFile(item))
            } else {
                return nil
            }
        }
    }
    
}

extension Tidy {
    
    public func create(options: CreateOptions, manager: VariablesManager) async throws {
        let data: Data?
        switch options.input {
        case .input(let file):
            if let text = String(data: try file.data(), encoding: .utf8) {
                data = try await manager.parse(text).data(using: .utf8)
            } else {
                data = .init()
            }
        case .text(let text):
            data = try await manager.parse(text).data(using: .utf8)
        }
        try options.output.overlay(with: data)
    }
    
    public func delete(options: CopyDeleteOptions) async throws {
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
