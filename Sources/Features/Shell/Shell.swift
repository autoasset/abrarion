//
//  File.swift
//  
//
//  Created by linhey on 2022/7/19.
//

import Stem
import Logging

public struct Shell: MissionInstance {
    
    public var logger: Logger?
    
    public static let environment: [String : String] = [
        "PATH": ["/bin",
                 "/sbin",
                 "/usr/bin",
                 "/usr/sbin",
                 "/opt/homebrew/bin",
                 "/opt/homebrew/sbin",
                 "/usr/local/bin",
                 "/usr/local/sbin",
                 "/usr/local/opt/ruby/bin",
                 "/Library/Apple/usr/bin"].joined(separator: ":"),
        "LANG": "en_US.UTF-8"
    ]
    
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
    
    public init() {}
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options  = try await Options(from: json, variables: context.variables)
        let commands = try await context.variables.parse(options.commands)
        for command in commands {
            do {
                logger?.info(.init(stringLiteral: command))
                let env = Shell.environment.merging(options.environment, uniquingKeysWith: { $1 })
                print(env)
                guard let result = try await StemShell.zsh(string: command, context: .init(environment: env)), !result.isEmpty else {
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
