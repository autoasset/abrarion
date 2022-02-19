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

public final class Download: ParsableCommand {
    
    public static let configuration = CommandConfiguration(commandName: "download",
                                                           subcommands: [])
    
    @Argument
    public var source: String?
    @Argument
    public var output: String?
    
    
    @Option(name: [.customLong("config")], help: "配置文件路径")
    public var config: String?
    
    public func validate() throws {
        if source == nil, config == nil {
            throw ParsableCommandError.parsableFail
        }
    }
    
    public init() {}
    
    public func run() async throws {
        guard let source = source, let source = URL(string: source) else {
            throw ParsableCommandError.parsableFail
        }
        switch Self.checkSourceType(source: source) {
            case .http:
            let model = DownloadModel(mode: .http, source: source, output: output!)
            try await Download.useHttp(model)
            case .git:
            let model = DownloadModel(mode: .git, source: source, output: output!)
            try Download.useGit(model)
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
        case .success(let value):
            break
        }
    }
    
}
