//
//  File.swift
//  
//
//  Created by linhey on 2022/2/9.
//

import Foundation
import ArgumentParser
import Stem

public final class XCAssets: AsyncParsableCommand {
    
    public static let configuration = CommandConfiguration(commandName: "xcassets",
                                                           subcommands: [
                                                            XCAssetsColor.self,
                                                            XCAssetsImage.self
                                                           ])
    
    public init() {}
    
}
