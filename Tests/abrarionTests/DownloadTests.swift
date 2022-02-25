//
//  File.swift
//  
//
//  Created by linhey on 2022/2/4.
//

import Foundation
@testable
import Download
import XCTest
import Stem

final class DownloadTests: AbrarionTests {

    func testSSHKeyFromConfig() throws {
        let config = try FilePath.File(path: "~/.ssh/id_github")
        let data = String(data: try config.data(), encoding: .utf8)
        print(data)
    }
    
    func testConfig() async throws {
        let config = DownloadConfig(models: [
            .init(mode: .auto,
                  source: "https://github.com/linhay/Stem.git",
                  output: "/Users/linhey/Desktop/ABRARION-TEST-DOWNLOAD-GIT-PRIVATE-COMMAND",
                  credentials: nil),
            .init(mode: .auto,
                  source: "http://n.sinaimg.cn/sinakd20220225s/318/w640h478/20220225/dc42-ff86243dc0cfe464a03b240e19b72dcd.jpg",
                  output: "/Users/linhey/Desktop/dc42-ff86243dc0cfe464a03b240e19b72dcd.jpg",
                  credentials: nil)
        ])
        try await Download.configTask(config: config)
    }
    
    func testGitCommand() throws {
        try runApp(bash: "download --source https://github.com/AxApp/abrarion --output /Users/linhey/Desktop/ABRARION-TEST-DOWNLOAD-GIT-PRIVATE-COMMAND --username linhay --password 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")
    }
    
    func testHttpCommand() throws {
        try runApp(bash: "download --source http://n.sinaimg.cn/sinakd20220225s/318/w640h478/20220225/dc42-ff86243dc0cfe464a03b240e19b72dcd.jpg --output /Users/linhey/Desktop/ABRARION-TEST-DOWNLOAD-HTTP")
    }
    
    func testGitDownload() async throws {
       try await Download.auto(.init(mode: .auto,
                                     source: "https://github.com/linhay/Stem.git",
                                     output: "/Users/linhey/Desktop/ABRARION-TEST-DOWNLOAD-GIT-HTTP",
                                     credentials: nil))
    }
    
    func testGitPrivateDownload() async throws {
        try await Download.auto(.init(mode: .git,
                                      source: "https://github.com/AxApp/abrarion",
                                      output: "/Users/linhey/Desktop/ABRARION-TEST-DOWNLOAD-GIT-PRIVATE-HTTP",
                                      credentials: .init(username: "linhay", password: "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")))
    }
    
}
