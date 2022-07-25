import ArgumentParser
import SwiftGit
import Features

@main
struct Abrarion: AsyncParsableCommand {
    
    static var configuration: CommandConfiguration = .init(version: AppInfo.shared.version,
                                                           subcommands: [Default.self,
                                                                         Publish.self],
                                                           defaultSubcommand: Default.self)
    
    func run() async throws { }
    
}

