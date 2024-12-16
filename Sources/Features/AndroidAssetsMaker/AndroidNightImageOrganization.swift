//
//  File.swift
//  
//
//  Created by linhey on 2022/12/27.
//

import Foundation
import Logging
import STFilePath
import Stem
import STJSON
import STColor

public struct AndroidNightImageOrganization: MissionInstance {
    
    public struct Options {
        /// 是否启用
        let enable: Bool
        let output_resources_path: STFolder
        /// 是否移除孤儿文件, a.png 与 a_dark.png 必须成对出现, 否则 a_dark.png 将被删除
        let is_remove_orphan_file: Bool
        public init(from json: JSON, variables: VariablesManager) async throws {
            guard json["output_resources_path"].isExists else {
                throw StemError("AndroidNightImageOrganization: 未包含必要参数 output_resources_path")
            }
        
            self.output_resources_path = try await STFolder(variables.parse(json["output_resources_path"].stringValue))
            self.is_remove_orphan_file = try await variables.parse(json: json["is_remove_orphan_file"]) ?? true
            self.enable = try await variables.parse(json: json["enable"]) ?? true
        }
    }
    
    public var logger: Logger?
    
    public init() {}
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        guard options.enable else {
            return
        }
        let src = options.output_resources_path

        let label = "_dark."
        
        for density in AndriodDensity.allCases {
            let light_folder = src.folder(density.rawValue)
            guard light_folder.isExist else {
                continue
            }
            
            let dark_files = try light_folder
                .subFilePaths()
                .compactMap(\.asFile)
                .filter { $0.attributes.name.contains(label) }
            
            var darkSet = Set(dark_files)
            /// a.png 与 a_dark.png 必须成对出现, 否则 a_dark.png 将被删除
            for file in dark_files {
                if !light_folder.file(file.attributes.name.replacingOccurrences(of: label, with: ".")).isExist {
                    if options.is_remove_orphan_file {
                        try? file.delete()
                    }
                    darkSet.remove(file)
                }
            }
            
            guard !darkSet.isEmpty else {
                continue
            }
            
            let night_folder = src.folder(density.night)
            _ = try? night_folder.create()
            
            for file in darkSet {
                let to = night_folder.file(file.attributes.name.replacingOccurrences(of: label, with: "."))
                try file.replace(to)
                try file.delete()
            }
        }
        
    }
    
}
