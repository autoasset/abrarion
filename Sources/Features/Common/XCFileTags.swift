//
//  File.swift
//  
//
//  Created by linhey on 2022/6/30.
//

import Foundation
import Stem
import STJSON
import STFilePath

fileprivate func parseStringList(from json: JSON, variables: VariablesManager) async throws -> [String] {
    var items = json
        .arrayValue
        .compactMap(\.string)
    
    if items.isEmpty, let item = json.string {
        items = [item]
    }
    
    return try await variables.parse(items)
}


public struct XCFileTags {
    
    enum Kind: String {
        case or
        case and
        case reversed_or
    }
    
    enum Substitute: String {
        case always_pass
        case always_fail
    }
    
    struct Expression {
        
        let name: String
        let kind: Kind
        let tags: [String]
        let substitute: Substitute
        let patterns: [NSRegularExpression]
        let inputs: [String]
        
        init(from json: JSON, variables: VariablesManager) async throws {
            self.inputs = try await parseStringList(from: json["inputs"], variables: variables)
            let name = try await variables.parse(json["name"].stringValue)
            self.name = name
            substitute = .init(rawValue: try await variables.parse(json["substitute"].stringValue)) ?? .always_fail
            self.tags = try await parseStringList(from: json["tags"], variables: variables)
            
            let files = try await parseStringList(from: json["files"], variables: variables)
                .map(STFile.init)
                .compactMap({ try? $0.data() })
                .compactMap({ String.init(data: $0, encoding: .utf8) })
                .map({ $0.split(separator: "\n") })
                .flatMap({ $0 })
                .compactMap({ $0.description.trimmingCharacters(in: .whitespacesAndNewlines) })
                .filter({ !$0.isEmpty })
            
            let patterns = try await parseStringList(from: json["patterns"], variables: variables)
            let files_patterns = try await variables.parse(files)
            
            self.patterns = try (patterns + files_patterns).map({ item in
                do {
                    return try NSRegularExpression(pattern: item)
                } catch {
                    throw StemError("XCFileTags: \(name) \(item) 错误")
                }
            })
            
            guard !tags.isEmpty else {
                throw StemError("XCFileTags: \(name) tags 缺失")
            }
            
            if let kind = Kind(rawValue: try await variables.parse(json["kind"].stringValue)) {
                self.kind = kind
            } else if self.patterns.isEmpty {
                self.kind = .and
            } else {
                throw StemError("XCFileTags: \(name) kind 缺失")
            }
        }
    }
    
    let vaild_tags: [String]
    let exclude_tags: [String]
    let expressions: [Expression]
    
    init?(from json: JSON, variables: VariablesManager) async throws {
        let json = json["file_tags"]
        guard json.isExists else {
            return nil
        }
        self.vaild_tags   = try await parseStringList(from: json["vaild_tags"], variables: variables)
        self.exclude_tags = try await parseStringList(from: json["exclude_tags"], variables: variables)
        self.expressions  = try await json["expressions"].arrayValue.asyncMap { item in
            try await Expression(from: item, variables: variables)
        }
    }
    
}
