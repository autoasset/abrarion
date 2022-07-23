//
//  File.swift
//  
//
//  Created by linhey on 2022/7/21.
//

import Stem
import StemFilePath
import Logging
import CollectionConcurrencyKit

public struct CustomVariables: MissionInstance {
    
    enum State {
        case shell(String)
        case value(String)
    }
    
    struct Record {
        let key: String
        let state: State
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            key = try await variables.parse(json["key"].stringValue)
            if let item = json["shell"].string {
                state = .shell(try await variables.parse(item))
            } else if let item = json["value"].string {
                state = .value(try await variables.parse(item))
            } else {
                throw StemError(message: "参数解析错误")
            }
        }
    }
    
    struct Options {
        let records: [Record]
        public init(from json: JSON, variables: VariablesManager) async throws {
            if let item = try await json.array?.asyncCompactMap({ try await Record(from: $0, variables: variables) }) {
                self.records = item
            } else {
                self.records = [try await Record(from: json, variables: variables)]
            }
        }
    }
    
    public var logger: Logger?
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        for record in options.records {
            logger?.info(.init(stringLiteral: "key: \(record.key)"))
            switch record.state {
            case .shell(let command):
                guard let item = try await StemShell.zsh(string: command, context: .init(environment: Shell.environment)) else {
                    return
                }
                let value = try await context.variables.parse(item)
                context.variables.register([.init(key: record.key, value: value)])
                logger?.info(.init(stringLiteral: "value: \(value)"))
            case .value(let item):
                let value = try await context.variables.parse(item)
                context.variables.register([.init(key: record.key, value: value)])
                logger?.info(.init(stringLiteral: "value: \(value)"))
            }
        }
    }
    
    public init() {}
    
}
