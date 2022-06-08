//
//  File.swift
//  
//
//  Created by linhey on 2022/6/8.
//

import Stem
import StemFilePath
import Foundation
import SwiftGit

public struct DownloadService {
    
    public static let shared = DownloadService()
    
}

public extension DownloadService {
    
    func request(_ model: Download) async throws {
        for item in model.items {
            try await request(item)
        }
    }
    
    func request(json: String) async throws {
        let json = JSON(parseJSON: json)
        let model = Download(from: json)
        try await request(model)
    }
    
}

private extension DownloadService {
    
    func request(_ model: Download.Item) async throws {
        guard let folder = try? STFolder(model.target.folder), let url = URL(string: model.uri) else {
            return
        }
        
        do {
            try await downloadable(url, in: folder)
        } catch {
            try await gitClone(url, in: folder, model: model)
        }
    }
    
    func gitClone(_ url: URL, in folder: STFolder, model: Download.Item) async throws {
        guard let name = model.target.name else {
            try Git.clone(repository: url, workDirectoryURL: folder.url)
            return
        }
        let file = folder.file(name: name)
        try Git.clone(repository: url, directory: file.path)
    }
    
    func downloadable(_ url: URL, in folder: STFolder) async throws {
        let fileURL = try await URLSession.shared.download(from: url, delegate: nil).0
        let file = STFile(fileURL)
        try file.replace(folder.file(name: url.lastPathComponent))
    }
    
}
