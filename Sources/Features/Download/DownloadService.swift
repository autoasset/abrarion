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

public struct DownloadService: MissionInstance {
    
    public init() {}
    
    public func evaluate(from json: JSON?, context: MissionContext) async throws {
        guard let json = json else {
            return
        }
        try await request(Download(from: json))
    }
    
    public func evaluate(from model: Download?) async throws {
        guard let model = model else {
            return
        }
        try await request(model)
    }
        
}

public extension DownloadService {
    
    func request(_ model: Download) async throws {
        for item in model.items {
            try await request(item)
        }
    }
    
}

private extension DownloadService {
    
    func request(_ model: Download.Item) async throws {
        let folder =  STFolder(model.target.folder)
        guard let url = URL(string: model.uri) else {
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
            try await Git.shared.clone([], repository: url, workDirectoryURL: folder.url)
            return
        }
        let file = folder.file(name: name)
        try await Git.shared.clone([], repository: url, directory: file.path)
    }
    
    func downloadable(_ url: URL, in folder: STFolder) async throws {
        let fileURL = try await URLSession.shared.download(from: url, delegate: nil).0
        let file = STFile(fileURL)
        let target = folder.file(name: url.lastPathComponent)
        try? target.delete()
        try file.copy(to: target)
    }
    
}
