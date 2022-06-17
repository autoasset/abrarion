//
//  File.swift
//  
//
//  Created by linhey on 2022/6/17.
//

import Stem

public protocol MissionInstance {
    func evaluate(from json: JSON?) async throws
}

public class MissionManager {
    
    var cache: [String: MissionInstance] = [:]
    
    public init() {}
    
    public func register<T: MissionInstance>(_ mission: T, for key: String) {
        cache[key] = mission
    }
    
    func run(name: String, with options: JSON?) async throws {
        if let instance = cache[name] {
            try await instance.evaluate(from: options)
        } else {
            throw StemError(message: "mission: 未实现相应任务实例 \(name)")
        }
    }
    
    public func run(from json: JSON) async throws {
        for mission in json["missions"].arrayValue {
            if let name = mission.string {
                try await run(name: name, with: nil)
            } else if let dictionary = mission.dictionary,
                      dictionary.keys.count == 1,
                      dictionary.values.count == 1,
                      let name = dictionary.keys.first,
                      let value = dictionary.values.first {
                if let `typealias` = value.string {
                    if json[`typealias`].exists() {
                        try await run(name: name, with: json[`typealias`])
                    } else {
                        throw StemError(message: "mission: 未定义相应任务配置 \(`typealias`)")
                    }
                } else {
                    try await run(name: name, with: value)
                }
            }
            else {
                throw StemError(message: "mission: 格式错误")
            }
        }
    }
    
}
