//
//  File.swift
//  
//
//  Created by linhey on 2022/6/8.
//

import Foundation
import XCTest
import Features
import Stem
import StemFilePath

class DownloadTests: XCTestCase {
    
    public struct JSONModeOptions: Codable {
        
        struct Target: Codable {
            var folder = "~/Downloads"
        }
        
        struct Item: Codable {
            var uri: String
        }
        
        var target = Target()
        var items = [
            Item(uri: "git@github.com:linhay/swift-git.git"),
            .init(uri: "https://github.com/linhay/swift-git/archive/refs/heads/main.zip")
        ]
        
    }
    
    func testDownload() async throws {
        try? STFile("~/Downloads/main.zip").delete()
        try? STFolder("~/Downloads/swift-git.git").delete()
        
        let input = JSONModeOptions()
        let options = try Download(from: JSON(data: Units.encode(input)))
        try await DownloadService().evaluate(from: options)
        
        try await assert(throwing: { try STFile("~/Downloads/main.zip").isExist })
        try await assert(throwing: { try STFolder("~/Downloads/swift-git.git").isExist })
    }
    
}
