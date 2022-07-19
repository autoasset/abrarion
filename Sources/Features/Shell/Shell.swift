//
//  File.swift
//  
//
//  Created by linhey on 2022/7/19.
//

import Stem

public struct Shell: MissionInstance {
    
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
        
        public init(from json: JSON) throws {
            if let str = json.string {
                self.commands = [str]
            } else {
                self.commands = json.arrayValue.compactMap(\.string)
            }
        }
    }
    
    public init() {}
    
    public func evaluate(from json: JSON?, context: MissionContext) async throws {
        guard let json = json else {
            return
        }
        
        let commands = try await context.variables.parse(try Options(from: json).commands)
        for command in commands {
            let result = try await StemShell.zsh(string: command, context: .init(environment: environment))
            print(result)
        }
    }
    
}
