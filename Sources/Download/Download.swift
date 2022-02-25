//
//  File.swift
//  
//
//  Created by linhey on 2022/2/4.
//

import Foundation
import ArgumentParser
import Core
import Stem
import SwiftGit

public final class Download: AsyncParsableCommand {
    
    public static let configuration = CommandConfiguration(commandName: "download",
                                                           subcommands: [ConfigCommand.self,
                                                                         DefaultCommand.self],
                                                           defaultSubcommand: DefaultCommand.self)
    
    public init() {}
    
    public func run() async throws { }
}

extension Download {
    
    final class DefaultCommand: AsyncParsableCommand {
        
        public static let configuration = CommandConfiguration(commandName: "default")
        
        @Option(name: [.long, .short])
        public var source: String
        @Option(name: [.long, .short])
        public var output: String
        @Option(name: [.long, .short])
        public var mode: String = "auto"
        @Option(name: [.long])
        public var username: String = ""
        @Option(name: [.long])
        public var password: String = ""
        
        public init() {}
        
        public func run() async throws {
            guard let source = URL(string: source) else {
                throw ParsableCommandError.parsableFail
            }
            let model = DownloadModel(mode: .init(rawValue: mode) ?? .auto,
                                      source: source,
                                      output: output,
                                      credentials: .init(username: username, password: password))
            try await Download.auto(model)
        }
        
    }
    
    final class ConfigCommand: ParsableCommand {
        public static let configuration = CommandConfiguration(commandName: "config",
                                                               subcommands: [])
        
        @Argument(help: "配置文件路径", completion: CompletionKind.file())
        public var source: String
        
        public init() {}
        
        public func run() async throws {
            guard let json = try json(from: source) else {
                throw ParsableCommandError.parsableFail
            }
            
            let config = DownloadConfig(from: json)
            for model in config.models {
                await withThrowingTaskGroup(of: Void.self) { group in
                    group.addTask(priority: .high) {
                        try await Download.auto(model)
                    }
                }
            }
        }
    }
    
}

extension Download {
    
    static func auto(_ model: DownloadModel) async throws {
        switch model.mode {
        case .auto:
            do {
                try await Download.git(model)
            } catch  {
                try await Download.http(model)
            }
        case .git:
            try await Download.git(model)
        case .http:
            try await Download.http(model)
        }
        
    }
    
    static func folder(_ model: DownloadModel) async throws -> FilePath.Folder {
        guard let folder = FilePath(url: .init(fileURLWithPath: model.output), type: .folder).asFolder else {
            throw ParsableCommandError.parsableFail
        }
        
        if folder.isExist, (try folder.subFilePaths().isEmpty) == false {
            throw FilePathError.folderIsNoEmpty
        }
        
        return folder
    }
    
    static func http(_ model: DownloadModel) async throws {
        let (data, _) = try await URLSession.shared.data(from: model.source)
        try FilePath.File(url: .init(fileURLWithPath: model.output)).create(with: data)
    }
    
    static func git(_ model: DownloadModel) async throws {
        let folder = try await folder(model)
        let credentials = model.credentials.flatMap({ Credentials.plaintext(username: $0.username, password: $0.password) })
        try await Git.shared.repo.clone(from: model.source, to: folder.url, credentials: credentials ?? .default)
    }
    
}
