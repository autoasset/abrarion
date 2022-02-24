import Foundation
import ArgumentParser
import Download
import XCAssets


@main
enum Main: AsyncMainProtocol {
    typealias Command = Abrarion
}

public struct Abrarion: AsyncParsableCommand {

    public static let configuration = CommandConfiguration(commandName: "abrarion",
                                                           version: "1",
                                                           subcommands: [Download.self])
    
    public init() {}
    
}
