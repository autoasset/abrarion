import ArgumentParser
import SwiftGit

@main
struct Abrarion: AsyncParsableCommand {
    
    static var configuration: CommandConfiguration = .init(version: "0.0.1",
                                                           subcommands: [Default.self,
                                                                         Publish.self],
                                                           defaultSubcommand: Default.self)

    func run() async throws { }
    
}

