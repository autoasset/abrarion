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
        
        var config: STFile
        var environment: STFile?
        
        public init(config: STFile, environment: STFile? = nil) {
            self.config = config
            self.environment = environment
        }
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            if let item = json.string {
                config = STFile(try await variables.parse(item))
            } else {
                config = STFile(try await variables.parse(json["config"].stringValue))
            }
            if let item = json["environment"].string {
                self.environment = STFile(try await variables.parse(item))
            } else {
                self.environment = nil
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
        missionManager.register(FlutterImageCodeMaker(), for: "flutter_images")
        missionManager.register(AndriodColorMaker(), for: "android_colors")
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
        guard let text = String(data: try options.config.data(), encoding: .utf8),
              let yaml = try Yams.load(yaml: text) else {
            return
        }
        
        let json = JSON(yaml)
        let last_variables = context.variables.cache.values
        
        let context = MissionContext()
        context.variables.register(last_variables)
        
        if let data = try options.environment?.data(),
           let text = String(data: data, encoding: .utf8),
           let yaml = try Yams.load(yaml: text),
           let array = JSON(yaml)
            .dictionary?
            .compactMapValues(\.string)
            .map({ Variables(key: $0.key, value: $0.value) }),
           array.isEmpty == false {
            context.variables.register(array)
        }
        
        let missionManager = missionManger()
        logger?.info(.init(stringLiteral: context.relativePath(options.config)))
        
        do {
            try await missionManager.run(from: json, context: context)
        } catch {
            let on_error = json["on_error"]
            guard on_error.isExists else {
                throw error
            }
            context.variables.register(.init(key: "error",
                                             value: error
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
