//
//  File.swift
//  
//
//  Created by linhey on 2022/7/23.
//

import Foundation
import Stem
import STJSON
import STFilePath
import Logging
import Yams

public struct MissionTask: MissionInstance {
    
    public var logger: Logger?
    
    public struct Options {
        
        var config_file: STFile?
        var environment_file: [STFile]?
        
        var config: JSON
        var environment: [Variables]
        
        public init(config: JSON, environment: [Variables]) {
            self.config = config
            self.environment = environment
        }
        
        static func json(fromYaml file: STFile) throws -> JSON {
            guard let file = file.path.removingPercentEncoding.flatMap(STFile.init),
                  let data = try? file.data(),
                  let text = String(data: data, encoding: .utf8),
                  let yaml = try Yams.load(yaml: text) else {
                throw StemError(message: "mission yaml 文件解析错误")
            }
            
            return JSON(yaml)
        }
        
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            
            func environment(from dict: [String: JSON]) throws -> [Variables] {
                dict
                    .compactMapValues({ json -> String? in
                        if let bool = json.bool {
                            return bool ? "true" : "false"
                        } else {
                            return json.string
                        }
                    })
                    .map({ Variables(key: $0.key, value: $0.value) })
            }
            
            func pluralVariablesFile(json: JSON) async throws -> [STFile]? {
                let array: [String]
                if let item = json.array?.compactMap(\.string) {
                    array = item
                } else if let item = json.string {
                    array = [item]
                } else {
                    return nil
                }
                return try await array.asyncMap { item in
                    try await STFile(variables.parse(item))
                }
            }
            
            func mergePluralFileVariables(_ files: [STFile]) async throws -> [Variables] {
                var variableKeySet = Set<String>()
                return try await files
                    .asyncCompactMap { file -> [Variables] in
                        let json = try Self.json(fromYaml: file).dictionaryValue
                        return try environment(from: json)
                    }
                    .reversed()
                    .flatMap({ $0 })
                    .filter({ variableKeySet.insert($0.key).inserted })
            }
            
            func mergeJsonVariables() throws -> [Variables] {
                try environment(from: json["environment"].dictionaryValue)
            }
            
            let config_json: JSON
            let environment: [Variables]
            let config_file: STFile?
            let environment_file: [STFile]?
            
            if let config = json["config"].string {
                let file = try await STFile(variables.parse(config))
                config_json = try Self.json(fromYaml: file)
                config_file = file
            } else {
                config_json = json["config"]
                config_file = nil
            }
            
            if let files = try await pluralVariablesFile(json: json["environment"]) {
                environment_file = files
                environment = try await mergePluralFileVariables(files)
            } else {
                environment_file = nil
                environment = try mergeJsonVariables()
            }
            
            self.init(config: config_json, environment: environment)
            self.config_file = config_file
            self.environment_file = environment_file
        }
        
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        try await evaluate(from: options, context: context)
        
    }
    
    func missionManger() async -> MissionManager {
        let missionManager = MissionManager()
        missionManager.register(XCReport.shared, for: "report")
        missionManager.register(KhalaReportInspection(), for: "khala_report_inspection")
        missionManager.register(PrintVariables(), for: "print_variables")
        missionManager.register(MissionTask(), for: "mission")
        missionManager.register(FlutterIconFontMaker(), for: "flutter_iconfont")
        missionManager.register(FlutterPubspecMaker(), for: "flutter_pubspec")
        missionManager.register(FlutterColorMaker(), for: "flutter_colors")
        missionManager.register(FlutterImageMaker(), for: "flutter_images")
        missionManager.register(AndriodColorMaker(), for: "android_colors")
        missionManager.register(AndriodImagesMaker(), for: "android_images")
        missionManager.register(AndroidNightImageOrganization(), for: "android_night_images_organization")
        missionManager.register(CustomVariables(), for: "variables")
        missionManager.register(Cocoapods(), for: "cocoapods_push")
        await missionManager.register(Shell(), for: "shell")
        missionManager.register(TidyDelete(), for: "tidy_delete")
        missionManager.register(TidyCreate(), for: "tidy_create")
        missionManager.register(TidyCopy(), for: "tidy_copy")
        missionManager.register(TidySize(), for: "tidy_size")
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
        let missionManager = await missionManger()
        
        if let file = options.config_file {
            if let environment = options.environment_file {
                let env_paths = environment.map { file in
                    file.relativePath(from: AppInfo.shared.pwd)
                }.joined(separator: "  ")
                logger?.info(.init(stringLiteral: "config: \(file.relativePath(from: AppInfo.shared.pwd)), environment: \(env_paths)"))
            } else {
                logger?.info(.init(stringLiteral: file.relativePath(from: AppInfo.shared.pwd)))
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
            context.variables.register(.init(key: "error", value: "\n" + error
                .localizedDescription
                .replacingOccurrences(of: "\'", with: "\"")
                .split(separator: "\n")
                .filter({ !$0.isEmpty })
                .joined(separator: "\n")))
            let missionManager = await missionManger()
            try await missionManager.run(from: .init(missions: on_error,
                                                     environment: .init(),
                                                     substitute_environment: .init()),
                                         context: context)
        }
    }
    
    public init() {}
    
}
