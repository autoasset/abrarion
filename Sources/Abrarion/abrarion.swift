import Foundation
import ArgumentParser
import Download

@main
public struct Abrarion: ParsableCommand {

    public static let configuration = CommandConfiguration(commandName: "abrarion",
                                                           version: "1",
                                                           subcommands: [Download.self])
    
    public init() {}
    
    public func run() throws {

    }
    
}
