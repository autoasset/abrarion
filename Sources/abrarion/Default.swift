//
//  File.swift
//  
//
//  Created by linhey on 2022/7/24.
//

import Foundation
import Features
import ArgumentParser
import Yams
import Stem
import STJSON
import STFilePath
import Logging
import SwiftGit

struct Default: AsyncParsableCommand {
    
    static var configuration: CommandConfiguration = .init(subcommands: [Publish.self])
    
    @Option(help: "任务流 yaml 文件路径",
            completion: .file(),
            transform: URL.init(fileURLWithPath:))
    var config: URL
    
    @Option(help: "外置环境变量 yaml 文件路径",
            completion: .file(),
            transform: URL.init(fileURLWithPath:))
    var environment: [URL]
        
    func run() async throws {
        let shell = try setupShell()
        
        try Git._shared = Git(environment: .init(type: .system, shell: shell))
        try Git.shared.shell = shell
        
        let logger = Logger(label: "[abrarion]")
        do {
            let context = MissionContext(shell: shell)
            try await context.variables.register(SystemVariables.variables())
            var task = MissionTask()
            task.logger = .init(label: "mission")
            let json: [String: Any] = ["config": config.absoluteString,
                                       "environment": environment.map(\.absoluteString)]
            try await task.evaluate(from: JSON(json), context: context)
            try XCReport.shared.finish()
        } catch {
            try XCReport.shared.finish()
            logger.error(.init(stringLiteral: error.localizedDescription))
            Abrarion.exit(withError: error)
        }
    }
    
}

