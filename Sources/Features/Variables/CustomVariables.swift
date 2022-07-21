//
//  File.swift
//  
//
//  Created by linhey on 2022/7/21.
//

import Stem
import StemFilePath
import Logging

public struct CustomVariables: MissionInstance {
    
    enum State {
        case shell(String)
        case value(String)
    }
    
    struct Options {
        
        let key: String
        let state: State
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            key = try await variables.parse(json["key"].stringValue)
            if let item = json["shell"].string {
                state = .shell(try await variables.parse(item))
            } else if let item = json["value"].string {
                state = .shell(try await variables.parse(item))
            } else {
                throw StemError(message: "参数解析错误")
            }
        }
        
    }
    
    public var logger: Logger?
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        switch options.state {
        case .shell(let command):
            guard let result = try await StemShell.zsh(string: command, context: .init(environment: Shell.environment)) else {
                return
            }
            context.variables.register([.init(key: options.key, value: result)])
        case .value(let item):
            context.variables.register([.init(key: options.key, value: item)])
        }
    }
    
    public init() {}
    
}
