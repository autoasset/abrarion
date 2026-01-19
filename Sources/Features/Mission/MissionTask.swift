//
//  File.swift
//
//
//  Created by linhey on 2022/7/23.
//

import Foundation
import Logging
import STFilePath
import STJSON
import Stem
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
            // Step 1: 解码路径
            guard let decodedPath = file.path.removingPercentEncoding else {
                throw StemError(message: "YAML 文件路径解码失败: \(file.path)")
            }

            let resolvedFile = STFile(decodedPath)

            // Step 2: 读取文件数据
            let data: Data
            do {
                data = try resolvedFile.data()
            } catch {
                throw StemError(
                    message: "YAML 文件读取失败: \(resolvedFile.path)\n原因: \(error.localizedDescription)")
            }

            // Step 3: 转换为 UTF-8 文本
            guard let text = String(data: data, encoding: .utf8) else {
                throw StemError(
                    message: "YAML 文件 UTF-8 编码转换失败: \(resolvedFile.path)\n数据大小: \(data.count) bytes"
                )
            }

            // Step 4: 解析 YAML
            let yaml: Any
            do {
                guard let parsed = try Yams.load(yaml: text) else {
                    throw StemError(message: "YAML 文件内容为空或无效: \(resolvedFile.path)")
                }
                yaml = parsed
            } catch let yamError {
                throw StemError(
                    message: "YAML 解析失败: \(resolvedFile.path)\n原因: \(yamError.localizedDescription)"
                )
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
                return
                    try await files
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
                let path = try await variables.parse(config)
                let file = STFile(path)
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

    func missionManger(context: MissionContext) async -> MissionManager {
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
        missionManager.register(
            AndroidNightImageOrganization(), for: "android_night_images_organization")
        missionManager.register(HarmonyOSImageMaker(), for: "harmonyos_images")
        missionManager.register(CustomVariables(), for: "variables")
        missionManager.register(Cocoapods(shell: context.shell), for: "cocoapods_push")
        missionManager.register(Shell(shell: context.shell), for: "shell")
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

        let context = context
        context.variables.register(last_variables)
        context.variables.register(options.environment)
        let missionManager = await missionManger(context: context)

        if let file = options.config_file {
            if let environment = options.environment_file {
                let env_paths = environment.map { file in
                    file.relativePath(from: AppInfo.shared.pwd)
                }.joined(separator: "  ")
                logger?.info(
                    .init(
                        stringLiteral:
                            "config: \(file.relativePath(from: AppInfo.shared.pwd)), environment: \(env_paths)"
                    ))
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
            context.variables.register(
                .init(
                    key: "error",
                    value: "\n"
                        + error
                        .localizedDescription
                        .replacingOccurrences(of: "\'", with: "\"")
                        .split(separator: "\n")
                        .filter({ !$0.isEmpty })
                        .joined(separator: "\n")))
            let missionManager = await missionManger(context: context)
            try await missionManager.run(
                from: .init(
                    missions: on_error,
                    environment: .init(),
                    substitute_environment: .init()),
                context: context)
        }
    }

    public init() {}

}
