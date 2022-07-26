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
import StemFilePath
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
    var environment: URL?
    
    func run() async throws {
        Git._shared = try Git(environment: .init(type: .system))
        let logger = Logger(label: "[abrarion]")
        do {
            let context = MissionContext()
            try await context.variables.register(SystemVariables.variables())
            let task = MissionTask()
            try await task.evaluate(from: .init(config: .init(config), environment: environment.flatMap(STFile.init)),
                                    context: context)
            try XCReport.shared.finish()
        } catch {
            try XCReport.shared.finish()
            logger.error(.init(stringLiteral: error.localizedDescription))
            Abrarion.exit(withError: error)
        }
    }
    
}

