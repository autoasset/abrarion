//
//  File.swift
//  
//
//  Created by linhey on 2022/2/9.
//

import Foundation
import ArgumentParser
import Stem

public final class XCAssets: ParsableCommand {
    
    public static let configuration = CommandConfiguration(commandName: "xcassets", subcommands: [XCAssetsColor.self])
    
    public init() {}
    
    public func run() throws {}
    
}
