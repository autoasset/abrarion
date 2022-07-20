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
    
    private let environment: [String : String] = [
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
        
        public init(from json: JSON) throws {
            self.allow_errors = json["allow_errors"].boolValue
            if let str = json.string {
                self.commands = [str]
            } else {
                self.commands = json.arrayValue.compactMap(\.string)
            }
        }
    }
    
    public init() {}
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options  = try Options(from: json)
        let commands = try await context.variables.parse(options.commands)
        for command in commands {
            do {
                guard let result = try await StemShell.zsh(string: command, context: .init(environment: environment)) else {
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
