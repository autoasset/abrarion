import ArgumentParser
import SwiftGit
import Features

@main
struct Abrarion: AsyncParsableCommand {
    
    static var configuration: CommandConfiguration = .init(abstract: "任务流编排工具",
                                                           usage: "abrarion --config missions.yaml --environment environment.yaml",
                                                           version: AppInfo.shared.version,
                                                           subcommands: [Default.self,
                                                                         VariablesCommand.self,
                                                                         Publish.self],
                                                           defaultSubcommand: Default.self)
    
    func run() async throws { }
    
}

