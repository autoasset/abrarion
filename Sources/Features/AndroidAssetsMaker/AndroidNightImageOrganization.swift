//
//  File.swift
//  
//
//  Created by linhey on 2022/12/27.
//

import Foundation
import Logging
import StemFilePath
import Stem

public struct AndroidNightImageOrganization: MissionInstance {
    
    public struct Options {
        let output_resources_path: STFolder
        /// 是否移除孤儿文件, a.png 与 a_dark.png 必须成对出现, 否则 a_dark.png 将被删除
        let isRemoveOrphanFile: Bool
        public init(from json: JSON, variables: VariablesManager) async throws {
            guard json["output_resources_path"].isExists else {
                throw StemError("AndroidNightImageOrganization: 未包含必要参数 output_resources_path")
            }
            self.output_resources_path = try await STFolder(variables.parse(json["output_resources_path"].stringValue))
            self.isRemoveOrphanFile = try await JSON(variables.parse(json["is_remove_orphan_file"].stringValue)).bool ?? true
        }
    }
    
    public var logger: Logger?
    
    public init() {}
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let src = options.output_resources_path

        let label = "_dark."
        
        for density in AndriodDensity.allCases {
            let light_folder = src.folder(name: density.rawValue)
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
                if !light_folder.file(name: file.attributes.name.replacingOccurrences(of: label, with: ".")).isExist {
                    if options.isRemoveOrphanFile {
                        try? file.delete()
                    }
                    darkSet.remove(file)
                }
            }
            
            guard !darkSet.isEmpty else {
                continue
            }
            
            let night_folder = src.folder(name: density.night)
            _ = try? night_folder.create()
            
            for file in darkSet {
                let to = night_folder.file(name: file.attributes.name.replacingOccurrences(of: label, with: "."))
                try file.replace(to)
                try file.delete()
            }
        }
        
    }
    
}
