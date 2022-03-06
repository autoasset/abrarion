//
//  File.swift
//  
//
//  Created by linhey on 2022/3/4.
//

import Foundation
import ArgumentParser

public final class XCAssetsData: AsyncParsableCommand {
    
    public static let configuration = CommandConfiguration(commandName: "data",
                                                           subcommands: [Default.self],
                                                           defaultSubcommand: Default.self)
    
    public init() {}
    
    public func run() async throws {
        
    }
    
}

extension XCAssetsData {
    
    final class Default: AsyncParsableCommand {
        
        public static let configuration = CommandConfiguration(commandName: "default", subcommands: [])
        
        @Argument(help: "扫描文件/文件夹路径")
        var sources: [String]
        
        @Option(name: [.long], help: "模板文件路径", completion: CompletionKind.file())
        var template: String = ""
        @Option(name: [.long], help: "输出文件夹路径")
        var xcassets_path: String
        @Option(name: [.long], help: "输出文件夹路径")
        var code_path: String = ""
        
        init() {}
        
        func run() async throws {
            
        }
        
    }
    
}

extension XCAssetsData {


}

