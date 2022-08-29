//
//  AndriodImagesMaker.swift
//  
//
//  Created by linhey on 2022/8/25.
//

import Stem
import Logging
import StemFilePath

struct AndriodImagesMaker: MissionInstance, XCMaker {
    
    public struct Options {
        
        let output_resources_path: STFolder
        let inputs: XCInputsOptions
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.inputs = try await XCInputsOptions(from: json, variables: variables)
            guard json["output_resources_path"].isExists else {
                throw StemError("AndriodImagesMaker: 未包含必要参数 output_resources_path")
            }
            self.output_resources_path = STFolder(try await variables.parse(json["output_resources_path"].stringValue))
        }
    }
    
    public var logger: Logger?
    
    public init() {}
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let vaild_files = try await XCInputFileManager(options.inputs).vaild_files()
     
        let images = options.output_resources_path
        try XCImageMark.marked(vaild_files).forEach { item in
            let folder: STFolder
            switch item.key {
            case .scale(let scale), .gif(let scale):
                switch scale {
                case 1:
                    folder = images.folder(name: "drawable-mdpi")
                case 2:
                    folder = images.folder(name: "drawable-xhdpi")
                case 3:
                    folder = images.folder(name: "drawable-xxhdpi")
                case 4:
                    folder = images.folder(name: "drawable-xxxhdpi")
                default:
                    return
                }
            case .android_vector:
                folder = images.folder(name: "drawable")
            case .unrecognisedScale, .unrecognisedGIFScale, .unknown, .vector:
                return
            }
            _ = try? folder.create()
            try item.value.forEach { file in
                try file.replace(folder.file(name: XCImageMark.filename(noScaleFactor: file)))
            }
        }
        
    }
    
}
