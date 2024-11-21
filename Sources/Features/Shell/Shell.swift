//
//  File.swift
//
//
//  Created by linhey on 2022/7/19.
//

import Foundation
import Stem
import STJSON
import Logging
import STFilePath

public struct Shell: MissionInstance {
    
    public var logger: Logger?
    
    struct Options {
        
        var commands: [String]
        var allow_errors: Bool
        var environment: [String: String]
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.allow_errors = json["allow_errors"].boolValue
            if let item = json.string {
                self.commands = [try await variables.parse(item)]
            } else if let item = json.array?.compactMap(\.string) {
                self.commands = try await variables.parse(item)
            } else {
                self.commands = try await variables.parse(json["commands"].arrayValue.map(\.stringValue))
            }
            self.environment = json["environment"].dictionaryValue.compactMapValues(\.string)
        }
    }
    
    var environment: [String: String] = [:]
    
    public init() async {
        do {
            environment = try STFile("~/.abrarion/environment.txt").read()
                .split(separator: "\n")
                .compactMap { row -> (key: String, value: String)? in
                    let list = row.split(separator: "=", maxSplits: 1)
                    guard list.count == 2 else {
                        return nil
                    }
                    return (list[0].description, list[1].description)
                }.dictionary(key: \.key, value: \.value)
        } catch {
            
        }
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options  = try await Options(from: json, variables: context.variables)
        let commands = try await context.variables.parse(options.commands)
        try await evaluate(commands: commands, environment: options.environment, allow_errors: options.allow_errors)
    }

    public func zsh( _ commands: String,
                     environment: [String: String] = [:],
                     allow_errors: Bool = false,
                     context: ((_ ctx: inout StemShell.Context) -> Void)? = nil) async throws -> String {
        var ctx = StemShell.Context(environment: self.environment.merging(environment, uniquingKeysWith: { $1 }))
        context?(&ctx)
        return try await StemShell.zsh(string: commands, context: ctx) ?? ""
    }
    
    public func data(exec: URL, _ commands: [String],
                     environment: [String: String] = [:],
                     allow_errors: Bool = false,
                     context: ((_ ctx: inout StemShell.Context) -> Void)? = nil) async throws -> String {
        var ctx = StemShell.Context(environment: self.environment.merging(environment, uniquingKeysWith: { $1 }))
        context?(&ctx)
        let data = try await StemShell.data(exec, commands, context: ctx)
        return .init(data: data, encoding: .utf8) ?? ""
    }
    
    @discardableResult
    public func evaluate(commands: [String], environment: [String: String] = [:], allow_errors: Bool = false) async throws -> String {
        let context = StemShell.Context(environment: self.environment.merging(environment, uniquingKeysWith: { $1 }))
        for command in commands {
            do {
                logger?.info(.init(stringLiteral: command))
                guard let result = try await StemShell.zsh(string: command, context: context), !result.isEmpty else {
                    return ""
                }
                logger?.info(.init(stringLiteral: result))
                return result
            } catch {
                if allow_errors {
                    print(error)
                    return error.localizedDescription
                } else {
                    throw error
                }
            }
        }
        return ""
    }
    
}
