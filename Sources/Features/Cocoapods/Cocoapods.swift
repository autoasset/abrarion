//
//  File.swift
//  
//
//  Created by linhey on 2022/7/19.
//

import Foundation
import Stem
import STJSON
import STFilePath
import SwiftGit
import Logging

public class Cocoapods: MissionInstance {
        
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        var options = try await Options(from: json, variables: context.variables)
        options = try await localLint(options)
        let repository = try SwiftGit.Repository(path: AppInfo.shared.pwd.path, environment: .init(type: .system))
        try await repository.add([], paths: ["."])
        try await repository.commit([.message("[ci skip] by abrarion(\(AppInfo.shared.version))")], pathspecs: .all)
        do {
            _ = try? await repository.tag([.delete], tagname: options.version)
            try await repository.tag([], tagname: options.version)
            try await repository.push.tag(options.version)
            try await trunkPush(options)
        } catch {
            try await repository.push.delete(.tag(.init(options.version)))
            if let name = options.name {
                _ = try? await shell("cache clean \(name) --all")
            }
            throw error
        }
    }
    
    public struct Options  {
        var name: String?
        var version: String
        var podspec_url: String
        let push_repository_url: String
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.version = try await variables.parse(json["version"].stringValue)
            self.podspec_url = try await variables.parse(json["podspec_url"].stringValue)
            self.push_repository_url = try await variables.parse(json["push_repository_url"].stringValue)
        }
    }
    
    func localLint(_ options: Options) async throws -> Options {
        /// 标准化 podspec 文件
        var options = options
        let jsonPodspec = try await validate(json: podspec(options), model: options)
        var podspec = STFile(options.podspec_url)
        guard let folder = podspec.parentFolder() else {
            return options
        }
        try podspec.delete()
        podspec = folder.file(String(podspec.attributes.name.split(separator: ".")[0]) + ".podspec.json")
        try podspec.overlay(with: jsonPodspec.rawData(options: [.sortedKeys, .withoutEscapingSlashes, .prettyPrinted]))
        options.podspec_url = podspec.path
        options.name = jsonPodspec["name"].string
        guard try await libLint(options) else {
            return options
        }
        return options
    }
    
    let shell: Shell
    public var logger: Logger?

    public init(shell: Shell) {
        self.shell = shell
    }
}

public extension Cocoapods {
    
    @discardableResult
    func shell(_ commands: String) async throws -> String? {
        do {
            let pod = try await shell.zsh("which pod")
            return try await shell.data(exec: URL.init(filePath: pod),
                                         commands.split(separator: " ").map(\.description),
                                         context: { ctx in
                if let paths = ctx.environment["PATH"]?.split(separator: ":") {
                    ctx.environment["PATH"] = paths.filter({ path in
                        if path.contains("homebrew"), path.contains("ruby") {
                            return false
                        } else {
                            return true
                        }
                    }).joined(separator: ":")
                }
            })
        } catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
    private func podspec(_ model: Options) async throws -> JSON {
        guard let str = try await shell("ipc spec \(model.podspec_url)") else {
            throw StemError(message: "cocoapod 解析失败")
        }
        return JSON(parseJSON: str)
    }
    
    private func validate(json: JSON, model: Options) throws -> JSON {
        var json = json
        
        guard let folder = STFile(model.podspec_url).parentFolder() else {
            throw StemError(message: "cocoapod 路径解析失败")
        }
        
        var resource_bundles = json["resource_bundles"].dictionaryValue
        for (name, list) in resource_bundles.compactMapValues(\.array) {
            if list.isEmpty {
                resource_bundles.removeValue(forKey: name)
                continue
            }
            var flag = true
            for path in list.compactMap(\.string) {
                if path.hasSuffix(".xcassets"), !folder.subpath(path).isExist {
                    continue
                } else {
                    flag = false
                }
            }
            if flag {
                resource_bundles.removeValue(forKey: name)
            }
        }
        
        json["resource_bundles"] = JSON(resource_bundles)
        return json
    }
    
}

/// version
public extension Cocoapods {
    
    var version: STVersion {
        get async {
            guard let str = try? await shell("--version") else {
                return .init(0, 0, 0)
            }
            return .init(stringLiteral: str.trimmingCharacters(in: .whitespacesAndNewlines))
        }
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
    
    func repositories() async throws -> [Repository] {
        guard let str = try await shell("repo list") else {
            return []
        }
        
        return str
            .components(separatedBy: "\n\n")
            .compactMap(Repository.init)
    }
    
    func repositoryAdd(url: String) async throws {
        guard let name = url.split(separator: "/").last?.split(separator: ".").first else {
            return
        }
        try await shell("repo add \(name) \(url)")
    }
    
    func libLint(_ model: Options) async throws -> Bool {
        _ = try await shell("lib lint \(model.podspec_url) --allow-warnings")
        return true
    }
    
    func trunkPush(_ model: Options) async throws {
        guard let name = try await repositories().first(where: { $0.url == model.push_repository_url })?.name else {
            try await repositoryAdd(url: model.push_repository_url)
            try await trunkPush(model)
            return
        }
        try await shell("repo push \(name) \(model.podspec_url) --allow-warnings")
    }
    
}

