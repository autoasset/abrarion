//
//  AndriodImagesMaker.swift
//  
//
//  Created by linhey on 2022/8/25.
//

import Stem
import STJSON
import StemColor
import Logging
import STFilePath

struct AndriodImagesMaker: MissionInstance, XCMaker {
    
    struct CustomInput {
        let density: AndriodDensity
        let tags: [String]
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            let densityValue = try await variables.parse(json["density"].stringValue)
            guard let density = AndriodDensity(rawValue: densityValue) else {
                throw StemError("android density error: \(densityValue)")
            }
            self.tags = try await variables.parse(json["tags"].stringArrayValue)
            self.density = density
        }
    }
    
    public struct Options {
        
        let output_resources_path: STFolder
        let inputs: XCInputsOptions
        let substitute_inputs: [CustomInput]
        let custom_inputs: [CustomInput]
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.inputs = try await XCInputsOptions(from: json, variables: variables)
            guard json["output_resources_path"].isExists else {
                throw StemError("AndriodImagesMaker: 未包含必要参数 output_resources_path")
            }
            self.output_resources_path = STFolder(try await variables.parse(json["output_resources_path"].stringValue))
            self.substitute_inputs = try await json["substitute_inputs"].arrayValue.asyncMap({ json in
                try await CustomInput(from: json, variables: variables)
            })
            self.custom_inputs = try await json["custom_inputs"].arrayValue.asyncMap({ json in
                try await CustomInput(from: json, variables: variables)
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
        let marked = XCImageMark.marked(vaild_files)
        let maxScale = marked.keys.compactMap { kind -> Int? in
            switch kind {
            case .scale(let scale), .gif(let scale):
                return scale
            default:
                return nil
            }
        }.max()
        
        try marked.forEach { item in
            let density: AndriodDensity
            switch item.key {
            case .scale(let scale), .gif(let scale):
                guard let temp = self.density(from: scale) else {
                    return
                }
                density = temp
            case .android_vector:
                density = .drawable
            case .unrecognisedGIFScale:
                guard let scale = maxScale else {
                    return
                }
                density = self.density(from: scale) ?? .xxhdpi
            case .unrecognisedScale, .unknown, .vector:
                return
            }
            try self.custom_replace(item.value, density: density, src: images, isReplace: true)
        }
        
        try await options.substitute_inputs.asyncForEach { input in
            let files = try await manager.files(tags: input.tags)
            guard files.isEmpty == false else {
                return
            }
            try self.custom_replace(.init(files), density: input.density, src: images, isReplace: false)
        }
        
        try await options.custom_inputs.asyncForEach { input in
            let files = try await manager.files(tags: input.tags)
            guard files.isEmpty == false else {
                return
            }
            try self.custom_replace(.init(files), density: input.density, src: images, isReplace: true)
        }
    }
    
}


private extension AndriodImagesMaker {
    
    func density(from scale: Int) -> AndriodDensity? {
        switch scale {
        case 1:  return .mdpi
        case 2:  return .xhdpi
        case 3:  return .xxhdpi
        case 4:  return .xxxhdpi
        default: return nil
        }
    }
    
    
    func android_filename(_ file: STFile) -> String {
        let name = XCImageMark.filename(noScaleFactor: file)
        if name.contains(".9") {
            return name.replacingOccurrences(of: ".9", with: "")
        } else {
            return name
        }
    }
    
    func custom_replace(_ files: Set<STFile>,
                        density: AndriodDensity,
                        src: STFolder,
                        isReplace: Bool) throws {
        let folder = src.folder(density.rawValue)
        _ = try? folder.create()

        let currentFiles = try folder
            .subFilePaths()
            .compactMap(\.asFile)
        
        var store: [String: STFile] = [:]
        
        for file in currentFiles {
            store[android_filename(file)] = file
        }
        
        for file in files {
            if let current = store[android_filename(file)] {
                if isReplace {
                    try current.delete()
                } else {
                    continue
                }
            }
            let to = folder.file(XCImageMark.filename(noScaleFactor: file))
            try file.replace(to)
        }
    }
    
}
