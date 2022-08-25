//
//  File.swift
//  
//
//  Created by linhey on 2022/7/23.
//

import Foundation
import Stem
import StemFilePath
import Logging
import Yams

public struct MissionTask: MissionInstance {
    
    public var logger: Logger?
    
    public struct Options {
        
        var config_file: STFile?
        var environment_file: STFile?
        
        var config: JSON
        var environment: [Variables]
        
        public init(config: JSON, environment: [Variables]) {
            self.config = config
            self.environment = environment
        }
        
       static func json(fromYaml file: STFile) throws -> JSON {
           guard let data = try? file.data(),
                 let text = String(data: data, encoding: .utf8),
                 let yaml = try Yams.load(yaml: text) else {
                throw StemError(message: "mission yaml 文件解析错误")

            }
            return JSON(yaml)
        }
        
        static func environment(from dict: [String: JSON]) throws -> [Variables] {
            return dict
                .compactMapValues(\.string)
                .map({ Variables(key: $0.key, value: $0.value) })
        }
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            if let config = json["config"].string {
                
                let config_file = try await STFile(variables.parse(config))
                let config_json = try Self.json(fromYaml: config_file)
                
                if let environment = json["environment"].string {
                    
                    let environment_file  = try await STFile(variables.parse(environment))
                    let environment_json  = try Self.json(fromYaml: environment_file).dictionaryValue
                    let environment_value = try Self.environment(from: environment_json)
                    
                     self.init(config: config_json, environment: environment_value)
                    self.environment_file = environment_file
                } else {
                    self.init(config: config_json, environment: try Self.environment(from: json["environment"].dictionaryValue))
                }
                self.config_file = config_file
            } else {
                let config = json["config"]
                
                if let environment = json["environment"].string {
                    
                    let environment_file  = try await STFile(variables.parse(environment))
                    let environment_json  = try Self.json(fromYaml: environment_file).dictionaryValue
                    let environment_value = try Self.environment(from: environment_json)
                    
                    self.init(config: config, environment: environment_value)
                    self.environment_file = environment_file
                } else {
                    try self.init(config: config, environment: Self.environment(from: json["environment"].dictionaryValue))
                }
            }
        }
        
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        try await evaluate(from: options, context: context)
        
    }
    
    func missionManger() -> MissionManager {
        let missionManager = MissionManager()
        missionManager.register(XCReport.shared, for: "report")
        missionManager.register(PrintVariables(), for: "print_variables")
        missionManager.register(MissionTask(), for: "mission")
        missionManager.register(FlutterIconFontMaker(), for: "flutter_iconfont")
        missionManager.register(FlutterPubspecMaker(), for: "flutter_pubspec")
        missionManager.register(FlutterColorMaker(), for: "flutter_colors")
        missionManager.register(FlutterImageMaker(), for: "flutter_images")
        missionManager.register(AndriodColorMaker(), for: "android_colors")
        missionManager.register(AndriodImagesMaker(), for: "android_images")
        missionManager.register(CustomVariables(), for: "variables")
        missionManager.register(Cocoapods(), for: "cocoapods_push")
        missionManager.register(Shell(), for: "shell")
        missionManager.register(TidyDelete(), for: "tidy_delete")
        missionManager.register(TidyCreate(), for: "tidy_create")
        missionManager.register(TidyCopy(), for: "tidy_copy")
        missionManager.register(XCColorMaker(), for: "xcassets_colors")
        missionManager.register(XCImageMaker(), for: "xcassets_images")
        missionManager.register(XCIconFontMaker(), for: "xcassets_iconfonts")
        missionManager.register(XCDataMaker(), for: "xcassets_datas")
        return missionManager
    }
    
    
    public func evaluate(from options: Options, context: MissionContext) async throws {
        let last_variables = context.variables.cache.values
        
        let context = MissionContext()
        context.variables.register(last_variables)
        context.variables.register(options.environment)
        let missionManager = missionManger()
        
        if let file = options.config_file {
            if let environment = options.environment_file {
                logger?.info(.init(stringLiteral: "config: \(context.relativePath(file)), environment: \(context.relativePath(environment))"))
            } else {
                logger?.info(.init(stringLiteral: context.relativePath(file)))
            }
        }
        
        do {
            try await missionManager.run(from: options.config, context: context)
        } catch {
            let on_error = options.config["on_error"]
            guard on_error.isExists else {
                throw error
            }
            Logger(label: "error").info(.init(stringLiteral: error.localizedDescription))
            context.variables.register(.init(key: "error", value: error
                .localizedDescription
                .replacingOccurrences(of: "\'", with: "\"")
                .split(separator: "\n")
                .joined(separator: ";")))
            let missionManager = missionManger()
            try await missionManager.run(from: .init(missions: on_error,
                                                     environment: .init(),
                                                     substitute_environment: .init()),
                                         context: context)
        }
    }
    
    public init() {}
    
}
