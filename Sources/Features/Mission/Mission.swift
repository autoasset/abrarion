//
//  File.swift
//  
//
//  Created by linhey on 2022/6/17.
//

import Stem
import STJSON
import Logging
import Foundation
import STFilePath

public struct MissionContext {
    
    public var variables = VariablesManager()
    public var shell: StemShell.Instance
    public init(shell: StemShell.Instance) {
        self.shell = shell
    }
    
}

public protocol MissionInstance {
    var logger: Logger? { get set }
    func evaluate(from json: JSON, context: MissionContext) async throws
}

public class MissionManager {
    
    var cache: [String: MissionInstance] = [:]
    let durationFormatter = NumberFormatter()
    
    public init() {
        durationFormatter.numberStyle = .decimal
        durationFormatter.formatWidth = 3
        durationFormatter.minimumFractionDigits = 3
        durationFormatter.maximumFractionDigits = 3
    }
    
    public func register<T: MissionInstance>(_ mission: T, for key: String) {
        var mission = mission
        mission.logger = Logger(label: "[\(key)]")
        cache[key] = mission
    }
    
    func run(name: String, with options: JSON, context: MissionContext) async throws {
        if let instance = cache[name] {
            let date = Date.now
            instance.logger?.info(.init(stringLiteral: "⏳⏳⏳ begining"))
            try await instance.evaluate(from: options, context: context)
            let sed = NSNumber(value: (Date.now.timeIntervalSince1970 - date.timeIntervalSince1970) * 1000)
            let duration = durationFormatter.string(from: sed) ?? ""
            instance.logger?.info(.init(stringLiteral: "✅✅✅ success: duration(\(duration)ms)"))
        } else {
            throw StemError(message: "mission: 未实现相应任务实例 \(name)")
        }
    }
    
    public struct Options {
        
        let missions: JSON
        let environment: JSON
        let substitute_environment: JSON
        
    }
    
    public func run(from json: JSON, context: MissionContext) async throws {
        let options = Options(missions: json["missions"],
                              environment: json["environment"],
                              substitute_environment: json["substitute_environment"])
        try await run(from: options, context: context)
    }
    
    public func run(from options: Options, context: MissionContext) async throws {
        /// 环境变量
        options.environment.dictionaryValue
            .compactMapValues(\.string)
            .forEach { item in
                context.variables.register(Variables(key: item.key, value: item.value))
            }
        
        /// 备选环境变量
        options.substitute_environment.dictionaryValue
            .compactMapValues(\.string)
            .filter { !context.variables.has($0.key) }
            .forEach { item in
                context.variables.register(Variables(key: item.key, value: item.value))
            }
        
        for mission in options.missions.arrayValue {
            
            /** 无配置参数任务
             {
             "missions": ["task_name"]
             }
             */
            if let name = mission.string {
                try await run(name: name, with: JSON(), context: context)
                continue
            }
            
            guard let dictionary = mission.dictionary,
                  dictionary.keys.count == 1, dictionary.values.count == 1,
                  let name = dictionary.keys.first,
                  let args = dictionary.values.first else {
                throw StemError(message: "mission(格式错误): \(mission.description)")
            }
            try await run(name: name, with: args, context: context)
        }
    }
}
