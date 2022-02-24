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
    
    func testHttp() throws {
        try runApp(bash: "download --source https://github.com --output ./github")
    }
    
    func testGitHttpDownload() throws {
        try Download.useGit(.init(mode: .git,
                                  source: "https://github.com/linhay/Stem.git",
                                  output: "/Users/linhey/Desktop/ABRARION-TEST-DOWNLOAD-GIT-HTTP"))
    }
    
    func testGitPrivateHttpDownload() throws {
        try Download.useGit(.init(mode: .git,
                                  source: "https://github.com/AxApp/abrarion",
                                  output: "/Users/linhey/Desktop/ABRARION-TEST-DOWNLOAD-GIT-PRIVATE-HTTP"))
    }
    
}
