import Foundation
import ArgumentParser
import Download
import XCAssets

@main
public struct Abrarion: AsyncParsableCommand {
    
    public static let configuration = CommandConfiguration(commandName: "abrarion",
                                                           version: "1",
                                                           subcommands: [
                                                            Download.self,
                                                            XCAssets.self
                                                           ])
    
    public init() {}
    
}
