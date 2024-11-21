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
            let dict = try STFile("~/.abrarion/environment.txt").read()
                .split(separator: "\n")
                .compactMap { row -> (key: String, value: String)? in
                    let list = row.split(separator: "=", maxSplits: 1)
                    guard list.count == 2 else {
                        return nil
                    }
                    return (list[0].description, list[1].description)
                }.dictionary(key: \.key, value: \.value)
            
            var syncs = [String]()
            if let value = try? STFile("~/.abrarion/sync-environment-keys.txt")
                .read()
                .split(separator: "\n")
                .map(\.description) {
                syncs = value
            }
            
            for key in Set(["SSH_AUTH_SOCK"] + syncs) {
                environment[key] = dict[key]
            }
        } catch {
            
        }
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options  = try await Options(from: json, variables: context.variables)
        let commands = try await context.variables.parse(options.commands)
        let context = StemShell.Context(environment: self.environment.merging(options.environment, uniquingKeysWith: { $1 }))
        for command in commands {
            do {
                logger?.info(.init(stringLiteral: command))
                guard let result = try await StemShell.zsh(string: command, context: context), !result.isEmpty else {
                    return
                }
                logger?.info(.init(stringLiteral: result))
            } catch {
                if options.allow_errors {
                    print(error)
                } else {
                    throw error
                }
            }
        }
        
    }
    
}
