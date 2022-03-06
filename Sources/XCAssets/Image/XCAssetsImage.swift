//
//  File.swift
//  
//
//  Created by linhey on 2022/2/20.
//

import Foundation
import ArgumentParser
import Core
import Stem

public final class XCAssetsImage: AsyncParsableCommand {
    
    public static let configuration = CommandConfiguration(commandName: "image",
                                                           subcommands: [Default.self,
                                                                         Config.self],
                                                           defaultSubcommand: Default.self)
    
    public init() {}
    
    public func run() async throws {}
    
}

extension XCAssetsImage {
    
    final class Config: AsyncParsableCommand {
        
        public static let configuration = CommandConfiguration(commandName: "config", subcommands: [])
        @Argument(help: "配置文件路径")
        var sources: [String]
        
        init() {}
        
        func run() async throws {
            let configs = try sources
                .compactMap { try json(from: $0) }
                .compactMap { try XCImageConfig(from: $0) }
            for config in configs {
                try await XCAssetsImage.createImagesetFiles(config: config)
            }
        }
        
    }
    
    final class Default: AsyncParsableCommand {
        
        public static let configuration = CommandConfiguration(commandName: "default", subcommands: [])
        
        @Argument(help: "扫描文件/文件夹路径")
        var sources: [String]
        
        @Option(name: [.long], help: "模板文件路径", completion: CompletionKind.file())
        var template: String = ""
        @Option(name: [.long], help: "输出文件夹路径", completion: CompletionKind.file())
        var xcassets: String = ""
        @Option(name: [.long], help: "输出文件夹路径", completion: CompletionKind.file())
        var code: String = ""
        @Option(name: [.long], help: "contents 匹配文件/文件夹路径", completion: CompletionKind.file())
        var contents: [String] = []
        
        init() {}
        
        func validate() throws {
            if xcassets.isEmpty == false {
                throw FilePathError.folderIsNoEmpty
            }
        }
        
        func run() async throws {
            let config = XCImageConfig(paths: .init(xcassets: xcassets,
                                                    template: template,
                                                    codes: code,
                                                    contents: contents,
                                                    sources: sources),
                                       darkModePatterns: [])

            let sets = try await XCAssetsImage.createImagesetFiles(config: config)

            if code.isEmpty == false {
                let template = XCImageTemplate(from: try? json(from: template))
                try await XCAssetsImage.createCodeFiles(sets: sets, template: template, folder: FilePath.Folder.init(path: code))
            }
        }
        
    }
    
}

extension XCAssetsImage {
    
    static func createCodeFiles(sets: [XCImageSet], template: XCImageTemplate, folder: FilePath.Folder) async throws {
        try XCImageCodesController(template: template, sets: sets)
            .output()
            .forEach { output in
                guard let data = output.code.data(using: .utf8) else {
                    return
                }
                try folder.open(name: output.name + ".swift").write(data)
            }
    }
    
    static func createImagesetFiles(config: XCImageConfig) async throws -> [XCImageSet] {
        let xcassets = try FilePath.Folder(path: config.paths.xcassets)
        
        let output = try await withThrowingTaskGroup(of: XCImagesetController.Output.self,
                                                     returning: XCImagesetController.Output.self) { group in
            for path in config.paths.sources {
                group.addTask(priority: .background) {
                    let folder = try FilePath.Folder(path: path)
                    return try await XCImagesetController.output(from: folder.allSubFilePaths().compactMap(\.asFile),
                                                                 darkModePatterns: config.darkModePatterns)
                }
            }
            
            var result = XCImagesetController.Output()
            for try await item in group {
                result.merge(item, uniquingKeysWith: { $0 + $1 })
            }
            
            return result
        }
        
        let contents = try config.paths.contents
            .map(FilePath.Folder.init(path:))
            .map({ try $0.allSubFilePaths() })
            .joined()
            .compactMap(\.asFile)
            .filter({ $0.attributes.name.lowercased().hasSuffix(".json") })
            .reduce([String: FilePath.File](), { result, item in
                guard let filename = item.attributes.name.split(separator: ".").first?.description else {
                    return result
                }
                
                var result = result
                result[filename] = item
                return result
            })
        
        
        var imageSets = [XCImageSet]()
        
        for (key, value) in output {
            
            let folder = try xcassets.create(folder: key + ".imageset")
            try folder.delete()
            try folder.create()
            
            let items = value.map(\.item)
            
            /// 存在 content 文件
            if let data = try contents[key]?.data(),
               let json = try? JSON(data: data),
               let content = try? await XCImageSet(contentFile: json, name: key, ivar: key) {
                imageSets.append(content)
                
                /// 使用矢量文件 [pdf, svg]
                let filenames = content.images.compactMap(\.filename)
                
                if content.properties.preservesVectorRepresentation {
                    let vectors = items.filter(\.isVector)
                    let vectorNames = vectors.map(\.file.attributes.name)
                    
                    for filename in filenames {
                        if vectorNames.contains(filename) == false {
                            throw StemError(code: 1, message: "在 \(key).json 里包含不存在的文件 \(filename)")
                        }
                    }
                    
                    try vectors.map(\.file).forEach { file in
                        try file.copy(into: folder)
                    }
                    
                    try folder.create(file: "Contents.json", data: data)
                } else {
                    let itemNames = items.map(\.file.attributes.name)
                    for filename in filenames {
                        if itemNames.contains(filename) == false {
                            throw StemError(code: 1, message: "在 \(key).json 里包含不存在的文件 \(filename)")
                        }
                    }
                    
                    try items.map(\.file).forEach { file in
                        try file.copy(into: folder)
                    }
                    
                    try folder.create(file: "Contents.json", data: data)
                }
            } else {
                let vectors = value.filter(\.item.isVector)
                if vectors.isEmpty {
                    try value.map(\.item.file).forEach { file in
                        try file.copy(into: folder)
                    }
                    let imageSet = XCImageSet(name: key,
                                              ivar: key,
                                              images: value.map(\.image),
                                              properties: .init())
                    imageSets.append(imageSet)
                    let data = try await XCImagesetController.contentFile(from: imageSet)
                    try folder.create(file: "Contents.json", data: data)
                } else {
                    try vectors.map(\.item.file).forEach { file in
                        try file.copy(into: folder)
                    }
                    let imageSet = XCImageSet(name: key,
                                              ivar: key,
                                              images: vectors.map(\.image),
                                              properties: .init(renderAs: .template,
                                                                compressionType: nil,
                                                                preservesVectorRepresentation: true))
                    imageSets.append(imageSet)
                    let data = try await XCImagesetController.contentFile(from: imageSet)
                    try folder.create(file: "Contents.json", data: data)
                }
            }
        }
        
        return imageSets
    }
    
}
