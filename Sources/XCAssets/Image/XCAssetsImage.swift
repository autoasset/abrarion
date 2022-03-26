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
               let sets = try await XCAssetsImage.createImagesetFiles(config: config)
                if let path = config.paths.codes, path.isEmpty == false {
                    try await XCAssetsImage.createCodeFiles(sets: sets,
                                                            template: config.template,
                                                            folder: FilePath.Folder(path: path))
                }
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
            if xcassets.isEmpty {
                throw FilePathError.folderIsNoEmpty(xcassets)
            }
        }
        
        func run() async throws {
            let config = XCImageConfig(paths: .init(xcassets: xcassets,
                                                    template: template,
                                                    codes: code,
                                                    contents: contents,
                                                    sources: sources),
                                       template: .init(from: nil),
                                       darkModePatterns: [])

            let sets = try await XCAssetsImage.createImagesetFiles(config: config)

            if code.isEmpty == false {
                let template = XCImageTemplate(from: try? json(from: template))
                try await XCAssetsImage.createCodeFiles(sets: sets, template: template, folder: FilePath.Folder(path: code))
            }
        }
        
    }
    
}

private extension XCAssetsImage {
    
    static func createCodeFiles(sets: [XCImageSet], template: XCImageTemplate, folder: FilePath.Folder) async throws {
        
        func noExistFile(name: String, ext: String, index: Int) -> FilePath.File {
            let file = folder.file(name: name + "\(index == 0 ? "" : "\(index)")" + "." + ext)
            if file.isExist {
               return noExistFile(name: name, ext: ext, index: index + 1)
            } else {
                return file
            }
        }
        
        try XCImageCodesController(template: template, sets: sets)
            .output()
            .forEach { output in
                guard let data = output.code.data(using: .utf8) else {
                    return
                }
                if output.canOverwritten {
                    let file = folder.file(name: output.name + ".swift")
                    try? file.delete()
                    try file.create(with: data)
                } else {
                    let file = noExistFile(name: output.name, ext: "swift", index: 0)
                    try file.write(data)
                }
            }
    }
    
    static func itemGroup(config: XCImageConfig) async throws -> XCImagesetController.Output {
        try await withThrowingTaskGroup(of: XCImagesetController.Output.self, returning: XCImagesetController.Output.self) { group in
            for path in config.paths.sources {
                group.addTask(priority: .background) {
                    let folder = try FilePath.Folder(path: path)
                    return try await XCImagesetController.output(from: folder.allSubFilePaths().compactMap(\.asFile),
                                                                 darkModePatterns: config.darkModePatterns)
                }
            }
            
            var symbols = [String : [XCImagesetController.OutputSymbolItem]]()
            var images = [String : [XCImagesetController.OutputImageItem]]()

            for try await item in group {
                for type in item {
                    switch type {
                    case .symbol(let model):
                        symbols = symbols.merging(model, uniquingKeysWith: { $0 + $1 })
                    case .image(let model):
                        images = images.merging(model, uniquingKeysWith: { $0 + $1 })
                    }
                }
            }
            
            return [.image(images), .symbol(symbols)]
        }
    }
    
    static func itemExistContents(config: XCImageConfig) async throws -> [String: [FilePath.File]] {
        try config.paths.contents
            .map(FilePath.Folder.init(path:))
            .map({ try $0.allSubFilePaths() })
            .joined()
            .compactMap(\.asFile)
            .filter({ $0.attributes.name.lowercased().hasSuffix(".json") })
            .reduce([String: [FilePath.File]](), { result, item in
                guard let filename = item.attributes.name.split(separator: ".").first?.description else {
                    return result
                }
                
                var result = result
                result[filename] = (result[filename] ?? []) + [item]
                return result
            })
    }
    
    struct AssetItem<Value> {
        let folderName: String
        let files: [FilePath.File]
        let content: Data
        let set: Value
    }
    
    static func newItem(filename: String, resource: [XCImagesetController.OutputSymbolItem], contents: [FilePath.File]) async throws -> AssetItem<XCImageSymbolSet> {
        let folderName = "\(filename).symbolset"
        let files: [FilePath.File] = resource.map(\.item.file)
        let content: Data
        let set: XCImageSymbolSet
        
        if let data = try? contents.first?.data() {
            content = data
            set = try await .init(contentFile: JSON(data: data))
        } else {
            set = XCImageSymbolSet(name: filename, ivar: filename, symbols: resource.map(\.symbol))
            content = try await XCImagesetController.contentFile(from: set)
        }
        
        return .init(folderName: folderName, files: files, content: content, set: set)
    }
    
    static func newItem(filename: String, resource: [XCImagesetController.OutputImageItem], contents: [FilePath.File]) async throws -> AssetItem<XCImageSet> {
        let folderName = "\(filename).imageset"
        let files: [FilePath.File] = resource.map(\.item.file)
        let content: Data
        let set: XCImageSet

        if let data = try? contents.first?.data() {
            content = data
            set = try await .init(contentFile: JSON(data: data), name: filename, ivar: filename)
        } else {
            set = XCImageSet(name: filename, ivar: filename, images: resource.map(\.image), properties: .init())
            content = try await XCImagesetController.contentFile(from: set)
        }
        
        return .init(folderName: folderName, files: files, content: content, set: set)
    }
    
    static func createImagesetFiles(config: XCImageConfig) async throws -> [XCImageSet] {
        
        let xcassets = try FilePath.Folder(path: config.paths.xcassets)
        let output   = try await itemGroup(config: config)
        let contents = try await itemExistContents(config: config)
        var list = [XCImageSet]()
        
        for type in output {
            switch type {
            case .symbol(let dict):
                for (key, value) in dict {
                    let item = try await newItem(filename: key, resource: value, contents: contents[key] ?? [])
                    let folder = try xcassets.create(folder: item.folderName)
                    try folder.delete()
                    try folder.create()
                    try item.files.forEach { file in
                       try file.copy(into: folder)
                    }
                    try folder.create(file: "Contents.json", data: item.content)
                    list.append(.init(name: item.set.name, ivar: item.set.name, images: item.set.symbols.map({ symbol in
                            .init(filename: symbol.filename, appearances: symbol.appearances)
                    }), properties: .init()))
                }
            case .image(let dict):
                for (key, value) in dict {
                    let item = try await newItem(filename: key, resource: value, contents: contents[key] ?? [])
                    let folder = try xcassets.create(folder: item.folderName)
                    try folder.delete()
                    try folder.create()
                    try item.files.forEach { file in
                       try file.copy(into: folder)
                    }
                    try folder.create(file: "Contents.json", data: item.content)
                    list.append(item.set)
                }
            }
        }
        
        return list
    }
    
}
