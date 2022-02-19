//
//  File.swift
//  
//
//  Created by linhey on 2022/2/9.
//

import Foundation
import ArgumentParser
import Core
import Stem

public final class XCAssetsColor: ParsableCommand {
    
    public static let configuration = CommandConfiguration(commandName: "color", subcommands: [])
    
    @Argument(parsing: .unconditionalRemaining)
    var names: [String]
    
    @Option(name: [.short, .long], help: "输出文件夹路径")
    var xcassetsPath: String
    
    @Option(name: [.short, .long], help: "输出文件夹路径")
    var codePath: String?
    
    @Option(name: [.short, .long], help: "配置文件路径")
    public var colors: String?
    
    @Option(name: [.short, .long], help: "模板文件路径")
    public var template: String?
    
    public init() {}
    
    public func run() throws {
        guard let colors = try json(from: colors) else {
            return
        }
        
        let sets = XCAssetsColor.parse(colorSets: colors)
        let folder = try FilePath.Folder(path: xcassetsPath)
        try XCAssetsColor.createColorsetFiles(sets: sets, folder: folder)
        
        if let output = codePath {
            let template = XCAssetsColor.parse(template: try? json(from: template))
            let folder = try FilePath.Folder(path: output)
            try XCAssetsColor.createCodeFiles(sets: sets, template: template, folder: folder)
        }
    }
    
}



extension XCAssetsColor {
    
    static func useCommandLine() throws {
        
    }
    
    static func parse(template json: JSON?) -> XCColorTemplate {
        if let json = json {
            return XCColorTemplate(instanceName: json["instance_name"].string ?? "AbrarionColor",
                                   protocolName: json["protocol_name"].string ?? "AbrarionColorProtocol")
        }
        return XCColorTemplate(instanceName: "AbrarionColor", protocolName: "AbrarionColorProtocol")
    }
    
    static func parse(colorSets json: JSON) -> [XCColorSet] {
        return json.arrayValue
            .map { json -> XCColorSet in
                
                var any: XCColorSet.Color?
                var light: XCColorSet.Color?
                var dark: XCColorSet.Color?
                
                if let hex = json["dark"].string {
                    dark = XCColorSet.Color(appearances: [.luminosity(.dark)],
                                            space: .displayP3,
                                            value: .init(hex: hex))
                }
                
                if let hex = json["any"].string {
                    any = XCColorSet.Color(appearances: [],
                                           space: .displayP3,
                                           value: .init(hex: hex))
                }
                
                if let hex = json["light"].string {
                    light = XCColorSet.Color(appearances: [.luminosity(.light)],
                                             space: .displayP3,
                                             value: .init(hex: hex))
                } else if dark != nil, let temp = any {
                    light = XCColorSet.Color(appearances: [.luminosity(.light)],
                                             space: .displayP3,
                                             value: temp.value)
                }
                
                var names = json["names"].arrayValue.compactMap(\.string)
                var ivars = names
                
                if names.isEmpty,
                   let hex = (light ?? any)?.value.hexString(.auto, prefix: .none) {
                    names.append(hex)
                    ivars.append("_\(hex)")
                }
                
                return XCColorSet(names: names,
                                  ivars: ivars,
                                  colors: [any, light, dark].compactMap({ $0 }))
            }
    }
    
    static func createColorsetFiles(sets: [XCColorSet], folder: FilePath.Folder) throws {
        try sets.map { set in
            try XCColorSetFileIOController(set: set).output()
        }
        .joined()
        .map({ $0 })
        .forEach({ output in
            let folder = folder.folder(name: output.name + ".colorset")
            try folder.delete()
            try folder.create()
            try folder.create(file: "Contents.json", data: output.content)
        })
    }
    
    static func createCodeFiles(sets: [XCColorSet], template: XCColorTemplate, folder: FilePath.Folder) throws {
        try XCColorSetTemplateController(template: template, sets: sets)
            .output()
            .forEach { output in
                guard let data = output.code.data(using: .utf8) else {
                    return
                }
                try folder.open(name: output.name + ".swift").write(data)
            }
    }
    
}
