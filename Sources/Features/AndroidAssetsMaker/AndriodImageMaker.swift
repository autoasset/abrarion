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
    
    enum Density: String {
        case drawable = "drawable"
        case ldpi     = "drawable-ldpi"
        case mdpi     = "drawable-mdpi"
        case hdpi     = "drawable-hdpi"
        case xhdpi    = "drawable-xhdpi"
        case xxhdpi   = "drawable-xxhdpi"
        case xxxhdpi  = "drawable-xxxhdpi"
    }
    
    struct SubstituteInput {
        let density: Density
        let tags: [String]
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            let densityValue = try await variables.parse(json["density"].stringValue)
            guard let density = Density(rawValue: densityValue) else {
                throw StemError("android density error: \(densityValue)")
            }
            self.tags = try await variables.parse(json["tags"].stringArrayValue)
            self.density = density
        }
    }
    
    public struct Options {
        
        let output_resources_path: STFolder
        let inputs: XCInputsOptions
        let substitute_inputs: [SubstituteInput]
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.inputs = try await XCInputsOptions(from: json, variables: variables)
            guard json["output_resources_path"].isExists else {
                throw StemError("AndriodImagesMaker: 未包含必要参数 output_resources_path")
            }
            self.output_resources_path = STFolder(try await variables.parse(json["output_resources_path"].stringValue))
            self.substitute_inputs = try await json["substitute_inputs"].arrayValue.asyncMap({ json in
               try await SubstituteInput(from: json, variables: variables)
            })
        }
    }
    
    public var logger: Logger?
    
    public init() {}
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let manager = try await XCInputFileManager(options.inputs)
        let vaild_files = try await manager.vaild_files()
     
        let images = options.output_resources_path
        try XCImageMark.marked(vaild_files).forEach { item in
            let folder: STFolder
            switch item.key {
            case .scale(let scale), .gif(let scale):
                switch scale {
                case 1:
                    folder = images.folder(name: Density.mdpi.rawValue)
                case 2:
                    folder = images.folder(name: Density.xhdpi.rawValue)
                case 3:
                    folder = images.folder(name: Density.xxxhdpi.rawValue)
                case 4:
                    folder = images.folder(name: Density.xxxhdpi.rawValue)
                default:
                    return
                }
            case .android_vector:
                folder = images.folder(name: Density.drawable.rawValue)
            case .unrecognisedScale, .unrecognisedGIFScale, .unknown, .vector:
                return
            }
            _ = try? folder.create()
            try item.value.forEach { file in
                try file.replace(folder.file(name: XCImageMark.filename(noScaleFactor: file)))
            }
        }
        
        try await options.substitute_inputs.asyncForEach { input in
            let files = try await manager.files(tags: input.tags)
            guard files.isEmpty == false else {
                return
            }
            let folder = images.folder(name: input.density.rawValue)
            _ = try? folder.create()
            
            /// 处理 .9 图
            let namesList = try folder
                .allSubFilePaths()
                .compactMap(\.asFile)
                .map(\.attributes.name)
                .compactMap({ $0.split(separator: ".").first })
            let namesSet = Set(namesList)
            
            try files.filter { file in
                if !file.attributes.name.hasPrefix("."),
                   let name = file.attributes.name.split(separator: ".").first {
                    return !namesSet.contains(name)
                } else {
                    return false
                }
            }.forEach { file in
                try file.copy(into: folder)
            }
            
        }
    }
}
