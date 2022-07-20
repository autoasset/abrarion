//
//  File.swift
//  
//
//  Created by linhey on 2022/7/19.
//

import Foundation
import Stem
import StemFilePath
import SwiftGit
import Logging

public class Cocoapods: MissionInstance {
    
    public var logger: Logger?
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        
    }

    public struct JSONModeOptions {
        
        var version: String
        var podspec_url: String
        let push_repository_url: String
        
        public init(from json: JSON) throws {
            self.version = json["version"].stringValue
            self.podspec_url = json["podspec_url"].stringValue
            self.push_repository_url = json["push_repository_url"].stringValue
        }
    }
    
    private static let environment: [String : String] = [
        "PATH": ["/bin",
                 "/sbin",
                 "/usr/bin",
                 "/usr/sbin",
                 "/opt/homebrew/bin",
                 "/opt/homebrew/sbin",
                 "/usr/local/bin",
                 "/usr/local/sbin",
                 "/usr/local/opt/ruby/bin",
                 "/Library/Apple/usr/bin"].joined(separator: ":"),
        "LANG": "en_US.UTF-8",
        "CP_HOME_DIR": "\(NSHomeDirectory())/.cocoapods"
    ]
    
    func localLint(_ options: JSONModeOptions) async throws -> JSONModeOptions? {
        /// 标准化 podspec 文件
        var options = options
        let jsonPodspec = try validate(json: podspec(options), model: options)
        var podspec = STFile(options.podspec_url)
        guard let folder = podspec.parentFolder() else {
            return nil
        }
        try podspec.delete()
        podspec = folder.file(name: String(podspec.attributes.name.split(separator: ".")[0]) + ".podspec.json")
        try podspec.overlay(with: jsonPodspec.rawData())
        options.podspec_url = podspec.path
        
        guard try libLint(options) else {
            return nil
        }
        return options
    }
    
}

public extension Cocoapods {
    
    private func podspec(_ model: JSONModeOptions) throws -> JSON {
        guard let str = try StemShell.zsh(string: "pod ipc spec \(model.podspec_url)", context: .init(environment: Cocoapods.environment)) else {
            throw StemError(message: "cocoapod 解析失败")
        }
        return JSON(parseJSON: str)
    }
    
    private func validate(json: JSON, model: JSONModeOptions) throws -> JSON {
        var json = json
        
        guard let folder = STFile(model.podspec_url).parentFolder() else {
            throw StemError(message: "cocoapod 路径解析失败")
        }
        
        var resource_bundles = json["resource_bundles"].dictionaryValue
        for (name, path) in resource_bundles.compactMapValues(\.string) {
            if path.hasSuffix(".xcassets"), !folder.subpath(name: path).isExist {
                resource_bundles.removeValue(forKey: name)
            }
        }
        
        json["resource_bundles"] = JSON(resource_bundles)
        return json
    }
    
}

/// version
public extension Cocoapods {
    
    static var version: STVersion {
        guard let str = try? StemShell.zsh(string: "pod --version", context: .init(environment: environment)) else {
            return .init(0, 0, 0)
        }
        return .init(stringLiteral: str.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
}

// spec-repositories
public extension Cocoapods {
    
    struct Repository {
        
        public let name: String
        public let type: String
        public let url: String
        public let path: String
        
        init?(_ value: String) {
            let list = value.split(separator: "\n").map({ $0.description })
            guard list.count == 4 else {
                return nil
            }
            name = list[0]
            type = list[1].replacingOccurrences(of: "- Type: ", with: "")
            url  = list[2].replacingOccurrences(of: "- URL:  ", with: "")
            path = list[3].replacingOccurrences(of: "- Path: ", with: "")
        }
    }
    
    static func repositories() throws -> [Repository] {
        guard let str = try StemShell.zsh(string: "pod repo list", context: .init(environment: environment)) else {
            return []
        }
        
        return str
            .components(separatedBy: "\n\n")
            .compactMap(Repository.init)
    }
    
    static func repositoryAdd(url: String) throws {
        guard let name = url.split(separator: "/").last?.split(separator: ".").first else {
            return
        }
        try StemShell.zsh(string: "pod repo add \(name) \(url)", context: .init(environment: environment))
    }
    
    func libLint(_ model: JSONModeOptions) throws -> Bool {
        _ = try StemShell.zsh(string: "pod lib lint \(model.podspec_url) --allow-warnings", context: .init(environment: Cocoapods.environment))
        return true
    }
    
    func trunkPush(_ model: JSONModeOptions) throws {
        guard let name = try Cocoapods.repositories().first(where: { $0.url == model.push_repository_url })?.name else {
            try Cocoapods.repositoryAdd(url: model.push_repository_url)
            try trunkPush(model)
            return
        }
        try StemShell.zsh(string: "pod repo push \(name) \(model.podspec_url) --allow-warnings",
                          context: .init(environment: Cocoapods.environment))
    }
    
}

