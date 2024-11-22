//
//  File.swift
//  
//
//  Created by linhey on 2022/7/26.
//

import ArgumentParser
import Stem
import STJSON
import Features

struct VariablesCommand: AsyncParsableCommand {
    
    static var configuration: CommandConfiguration = .init(commandName: "variables", abstract: "查看内置变量键值表")
    
    func run() async throws {
        var mission = PrintVariables()
        mission.logger = .init(label: "variables")
        try await mission.evaluate(from: JSON(), context: .init(shell: setupShell()))
    }
    
}
