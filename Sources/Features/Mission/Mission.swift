//
//  File.swift
//  
//
//  Created by linhey on 2022/6/17.
//

import Stem

public struct MissionContext {
    
    public var variables = VariablesManager()
    
    public init() {
        
    }
    
}

public protocol MissionInstance {
    func evaluate(from json: JSON?, context: MissionContext) async throws
}

public class MissionManager {
    
    var cache: [String: MissionInstance] = [:]
    
    public init() {}
    
    public func register<T: MissionInstance>(_ mission: T, for key: String) {
        cache[key] = mission
    }
    
    func run(name: String, with options: JSON?, context: MissionContext) async throws {
        if let instance = cache[name] {
            try await instance.evaluate(from: options, context: context)
        } else {
            throw StemError(message: "mission: 未实现相应任务实例 \(name)")
        }
    }
    
    public func run(from json: JSON, context: MissionContext) async throws {
        
        json["environment"].dictionaryValue
            .compactMapValues(\.string)
            .forEach { item in
                context.variables.register(Variables(key: item.key, value: item.value))
            }
        
        for mission in json["missions"].arrayValue {
            
            /** 无配置参数任务
             {
             "missions": ["task_name"]
             }
             */
            if let name = mission.string {
                try await run(name: name, with: nil, context: context)
                continue
            }
            
            /** 参数任务与外置参数调用
             {
             "missions":[
             {
             "task_name":{
             "arg1":"value1",
             "arg2":"value2",
             "merge":[
             "merge_1"
             ]
             }
             }
             ],
             "environment": {
             
             }
             "merge_1":{
             "arg3":"value3",
             "arg4":"value4"
             }
             }
             */
            guard let dictionary = mission.dictionary,
                  dictionary.keys.count == 1, dictionary.values.count == 1,
                  let name = dictionary.keys.first, var args = dictionary.values.first else {
                throw StemError(message: "mission(格式错误): \(mission.description)")
            }
            
            let mergeKey = "merge"
            let merges = args[mergeKey]
                .arrayValue
                .compactMap(\.string)
                .dictionary(key: \.self, value: { json[$0] })
                .filter(\.value.isExists)
            
            
            if merges.isEmpty == false {
                args.dictionaryObject?.removeValue(forKey: mergeKey)
                for (name, merge) in merges {
                    if merge.dictionary == nil {
                        throw StemError(message: "mission: 外置参数格式错误 \(name)")
                    }
                }
                let merged = try merges.map(\.value).reduce(JSON()) { result, item in
                    try result.merged(with: item)
                }
                args = try merged.merged(with: args)
            }
            
            
            try await run(name: name, with: args, context: context)
        }
    }
}
