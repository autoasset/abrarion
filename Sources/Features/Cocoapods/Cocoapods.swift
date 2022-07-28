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
        var options = try await Options(from: json, variables: context.variables)
        options = try await localLint(options)
        let repository = try SwiftGit.Repository(path: context.pwd.path, environment: .init(type: .system))
        try await repository.add([], paths: ["."])
        try await repository.commit([.message("[ci skip] by abrarion(\(AppInfo.shared.version))")], pathspecs: .all)
        do {
            _ = try? await repository.tag([.delete], tagname: options.version)
            try await repository.tag([], tagname: options.version)
            try await repository.push.tag(options.version)
            try trunkPush(options)
        } catch {
            try await repository.push.delete(.tag(.init(options.version)))
            if let name = options.name {
                _ = try? shell("cache clean \(name) --all")
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
        let jsonPodspec = try validate(json: podspec(options), model: options)
        var podspec = STFile(options.podspec_url)
        guard let folder = podspec.parentFolder() else {
            return options
        }
        try podspec.delete()
        podspec = folder.file(name: String(podspec.attributes.name.split(separator: ".")[0]) + ".podspec.json")
        try podspec.overlay(with: jsonPodspec.rawData(options: [.sortedKeys, .withoutEscapingSlashes, .prettyPrinted]))
        options.podspec_url = podspec.path
        options.name = jsonPodspec["name"].string
        guard try libLint(options) else {
            return options
        }
        return options
    }
    
    public init() {}
}

public extension Cocoapods {
    
    @discardableResult
    func shell(_ commands: String) throws -> String? {
        logger?.info(.init(stringLiteral: "pod " + commands))
        var environment = ProcessInfo.processInfo.environment.filter { item in
            item.key.lowercased().contains("rvm")
            || item.key.lowercased().contains("gem")
            || item.key.lowercased().contains("ruby")
        }
        environment["CP_HOME_DIR"] = ProcessInfo.processInfo.environment["CP_HOME_DIR"]
        guard let exec = try StemShell.zsh(string: "which pod", context: .init(environment: environment))?
            .split(separator: "\n")
            .first?
            .trimmingCharacters(in: .whitespacesAndNewlines) else {
            return nil
        }
        return try StemShell.string(.init(fileURLWithPath: exec),
                                    commands.split(separator: " ").map(\.description),
                                    context: .init(environment: environment))
    }
    
    private func podspec(_ model: Options) throws -> JSON {
        guard let str = try shell("ipc spec \(model.podspec_url)") else {
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
                if path.hasSuffix(".xcassets"), !folder.subpath(name: path).isExist {
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
        guard let str = try? shell("--version") else {
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
    
    func repositories() throws -> [Repository] {
        guard let str = try shell("repo list") else {
            return []
        }
        
        return str
            .components(separatedBy: "\n\n")
            .compactMap(Repository.init)
    }
    
    func repositoryAdd(url: String) throws {
        guard let name = url.split(separator: "/").last?.split(separator: ".").first else {
            return
        }
        try shell("repo add \(name) \(url)")
    }
    
    func libLint(_ model: Options) throws -> Bool {
        _ = try shell("lib lint \(model.podspec_url) --allow-warnings")
        return true
    }
    
    func trunkPush(_ model: Options) throws {
        guard let name = try repositories().first(where: { $0.url == model.push_repository_url })?.name else {
            try repositoryAdd(url: model.push_repository_url)
            try trunkPush(model)
            return
        }
        try shell("repo push \(name) \(model.podspec_url) --allow-warnings")
    }
    
}

