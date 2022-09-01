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
    
    struct CustomInput {
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
            let folder: STFolder
            
            switch item.key {
            case .scale(let scale), .gif(let scale):
                guard let density = self.density(from: scale) else {
                    return
                }
                folder = images.folder(name: density.rawValue)
            case .android_vector:
                folder = images.folder(name: Density.drawable.rawValue)
            case .unrecognisedGIFScale:
                guard let scale = maxScale else {
                    return
                }
                let density = self.density(from: scale) ?? .xxhdpi
                folder = images.folder(name: density.rawValue)
            case .unrecognisedScale, .unknown, .vector:
                return
            }
            try self.custom_replace(item.value, into: folder)
        }
        
        try await options.substitute_inputs.asyncForEach { input in
            let files = try await manager.files(tags: input.tags)
            guard files.isEmpty == false else {
                return
            }
            let folder = images.folder(name: input.density.rawValue)
            try self.substitute_replace(.init(files), into: folder)
        }
        
        try await options.custom_inputs.asyncForEach { input in
            let files = try await manager.files(tags: input.tags)
            guard files.isEmpty == false else {
                return
            }
            let folder = images.folder(name: input.density.rawValue)
            try self.custom_replace(.init(files), into: folder)
        }
    }
    
}


private extension AndriodImagesMaker {
    
    func density(from scale: Int) -> Density? {
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
    
    func substitute_replace(_ files: Set<STFile>, into folder: STFolder) throws {
        _ = try? folder.create()

        let currentFiles = try folder
            .subFilePaths()
            .compactMap(\.asFile)
        
        var store: [String: STFile] = [:]
        
        for file in currentFiles {
            store[android_filename(file)] = file
        }
        
        for file in files {
            if store[android_filename(file)] != nil {
                continue
            }
            
            let to = folder.file(name: XCImageMark.filename(noScaleFactor: file))
            try file.replace(to)
        }
    }
    
    func custom_replace(_ files: Set<STFile>, into folder: STFolder) throws {
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
                try current.delete()
            }
            let to = folder.file(name: XCImageMark.filename(noScaleFactor: file))
            try file.replace(to)
        }
    }
    
}
