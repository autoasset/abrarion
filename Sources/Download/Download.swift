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
        
        public init() {}

        public func run() async throws {
            guard let source = URL(string: source) else {
                throw ParsableCommandError.parsableFail
            }
            switch Download.checkSourceType(source: source) {
                case .http:
                let model = DownloadModel(mode: .http, source: source, output: output)
                try await Download.useHttp(model)
                case .git:
                let model = DownloadModel(mode: .git, source: source, output: output)
                try Download.useGit(model)
            case .auto:
                break
            }
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
                        switch Download.checkSourceType(source: model.source) {
                        case .http:
                            let model = DownloadModel(mode: .http, source: model.source, output: model.output)
                            try await Download.useHttp(model)
                        case .git:
                            let model = DownloadModel(mode: .git, source: model.source, output: model.output)
                            try Download.useGit(model)
                        case .auto:
                            break
                        }
                    }
                }
            }
        }
    }
    
}

extension Download {
    
    static func checkSourceType(source: URL) -> DownloadModel.Mode {
        switch Repository.at(source) {
        case .failure:
            return .http
        case .success:
            return .git
        }
    }
    
    static func useHttp(_ model: DownloadModel) async throws {
        let (data, _) = try await URLSession.shared.data(from: model.source)
        try FilePath.File(url: .init(fileURLWithPath: model.output)).create(with: data)
    }
    
   static func useGit(_ model: DownloadModel) throws {
        guard let folder = FilePath(url: .init(fileURLWithPath: model.output), type: .folder).asFolder else {
                  return
              }
        
        if folder.isExist, (try folder.subFilePaths().isEmpty) == false {
            throw FilePathError.folderIsNoEmpty
        }
       
       let publicKey = try FilePath.File(path: "~/.ssh/id_github.pub").data()
       let privateKey = try FilePath.File(path: "~/.ssh/id_github").data()
       let passphrase = ""
       
       try? folder.delete()
       switch Git.shared.repository.clone(from: model.source, to: folder.url, credentials: .sshMemory(username: "linhey",
                                                                                                      publicKey: String(data: publicKey, encoding: .utf8)!,
                                                                                                      privateKey: String(data: privateKey, encoding: .utf8)!,
                                                                                                      passphrase: passphrase)) {
        case .failure(let error):
            throw error
        case .success:
            break
        }
    }
    
}
