//
//  File.swift
//  
//
//  Created by linhey on 2022/6/8.
//

import Foundation
import XCTest
import Features

class DownloadTests: XCTestCase {
    
    func testDownload() async throws {
        let json = """
{
    "target":{
        "folder":"~/Downloads"
    },
    "items":[
        {
            "uri":"git@github.com:linhay/SwiftGit.git"
        },
        {
            "uri":"https://github.com/linhay/SwiftGit/archive/refs/heads/main.zip"
        }
    ]
}
"""
        try await DownloadService.shared.request(json: json)

    }
    
}
