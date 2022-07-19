//
//  File.swift
//  
//
//  Created by linhey on 2022/6/12.
//

import Foundation
import Stem
import StemColor
import StemFilePath

public struct XCColorMaker: MissionInstance, XCMaker {
    
    public struct JSONModeOptions {
        fileprivate let template: XCCodeOptions?
        fileprivate let inputs: [String]
        fileprivate let output: String
        
        public init(from json: JSON) throws {
            self.template = try .init(from: json["template"], default: .init(type: "Color"))
            self.inputs = json["inputs"].arrayValue.compactMap(\.string)
            self.output = json["output"].stringValue
        }
    }
    
    public func evaluate(from json: JSON?, context: MissionContext) async throws {
        guard let json = json else {
            return
        }
        try await evaluate(options: try .init(from: json))
    }
    
    public func evaluate(options: JSONModeOptions) async throws {
       
        var set = Set<String>()

        let records = try await files(from: options.inputs)
            .compactMap({ try? JSON($0.data()) })
            .map(parse(from:))
            .filter({ !$0.isEmpty })
            .flatMap({ $0 })
            .reversed()
            .filter({ set.insert($0.names[0]).inserted })
            .sorted(by: { $0.names[0] > $1.names[0] })
        
        set.removeAll()
        
        if options.output.isEmpty == false {
            let folder = STFolder(options.output)
            if !folder.isExist {
                try folder.create()
            }
            try records
                .map { (record: $0, color: try asset(from:$0)) }
                .forEach { item in
                    try createAsset(in: folder, asset: item.color, record: item.record)
                }
        }
        
        if let template = options.template {
             try CodeMaker(options: template, records: records).evaluate()
        }
    }
    
    public init() {}
}

private extension XCColorMaker {
    
    struct Record {
        
        let names: [String]
        let any: StemColor
        let light: StemColor?
        let dark: StemColor?
        let space: String
        
        init?(from json: JSON) {
            guard let any = try? StemColor(throwing: json["any"].stringValue) else {
                return nil
            }
            
            var names = json["names"].arrayValue.compactMap(\.string)
            
            if names.isEmpty {
                names = [any.hexString(.auto, prefix: .none)]
            }
            
            let light = try? StemColor(throwing: json["light"].stringValue)
            let dark  = try? StemColor(throwing: json["dark"].stringValue)
            
            self.names = names
            self.any   = any
            self.light = dark == nil ? nil : light
            self.dark  = dark
            self.space = json["space"].stringValue
        }
        
        init(names: [String], any: StemColor, light: StemColor?, dark: StemColor?, space: String) {
            self.names = names
            self.any = any
            self.light = light
            self.dark = dark
            self.space = space
        }
        
        var splitByName: [Record] {
            names.map { .init(names: [$0], any: any, light: light, dark: dark, space: space) }
        }
    }
    
}

private extension XCColorMaker {
    
    func parse(from json: JSON) throws -> [Record] {
        return json.arrayValue
            .compactMap(Record.init(from:))
            .map(\.splitByName)
            .flatMap({ $0 })
    }
    
    func asset(from record: Record) throws -> XCAsset<XCColor> {
        var list = [XCColor]()
        
        list.append(XCColor(appearances: [],
                            space: .sRGB,
                            value: record.any,
                            displayGamut: .init(rawValue: record.space)))
        
        if let color = record.light {
            list.append(XCColor(appearances: [.luminosity(.light)],
                                space: .sRGB,
                                value: color,
                                displayGamut: .init(rawValue: record.space)))
        }
        
        if let color = record.dark {
            list.append(XCColor(appearances: [.luminosity(.dark)],
                                space: .sRGB,
                                value: color,
                                displayGamut: .init(rawValue: record.space)))
        }
        return .init(contents: list, properties: .default, info: .xcode)
    }
    
    func createAsset(in folder: STFolder, asset: XCAssetProtocol, record: Record) throws {
        let folder = folder.folder(name: record.names[0] + ".colorset")
        try folder.delete()
        try folder.create()
        try folder.create(file: "Contents.json", data: asset.data)
    }
    
}

private extension XCColorMaker {
    
    struct CodeMaker {
        
        let options: XCCodeOptions
        let records: [Record]
        
        func evaluate() throws {
            let file = STFile(options.instance_output_path)
            try file.delete()
            try file.create(with: instance.data(using: .utf8))
            
            let list = STFile(options.list_output_path)
            try list.delete()
            try list.create(with: `extension`.data(using: .utf8))
        }
        
        private func code(with record: Record) -> String {
            guard var name = record.names.first else {
                return ""
            }
            let light = record.light ?? record.any
            let dark  = record.dark?.hexString(.auto, prefix: .bits) ?? "nil"
            let lightPack = light.rgbSpace.unpack(as: Int.self)
            let mark  = "/** light => \(light.hexString(.auto, prefix: .none)) r: \(lightPack.red) g: \(lightPack.green) b: \(lightPack.blue) a: \(light.alpha) */"
            name = (try? StemColor(throwing: name)) == nil ? name : "_" + name
            return "\(mark) \n var \(name): \(options.instance_name) { .init(light: \(light.hexString(.auto, prefix: .bits)), dark: \(dark)) }"
        }
        
        private var `extension`: String {
            """
            public extension \(options.list_protocol_name) {
            \(records.map(code(with:)).joined(separator: "\n"))
            }
            """
        }
        
        private var instance: String {
    """
    #if canImport(UIKit)
    import UIKit
    #elseif canImport(AppKit)
    import AppKit
    #endif
    
    public protocol \(options.instance_protocol_name) {
        init(light: Int64, dark: Int64?)
    }
    
    public protocol \(options.list_protocol_name) {}
    
    public struct \(options.instance_name): \(options.instance_protocol_name) {
        
        #if canImport(UIKit)
        public typealias Color = UIColor
        #elseif canImport(AppKit)
        public typealias Color = NSColor
        #endif
        
        #if canImport(UIKit) || canImport(AppKit)
        public let light: Color
        public let dark: Color
        public let system: Color
        
        public init(light: Int64, dark: Int64?) {
            let light = Self.color(light)
            
            guard let hex = dark else {
                self.system = light
                self.light = light
                self.dark = light
                return
            }
            
            let dark = Self.color(hex)
            self.light = light
            self.dark = dark
            
            #if canImport(UIKit)
            if #available(iOS 13.0, *) {
                self.system = .init(dynamicProvider: { $0.userInterfaceStyle == .dark ? dark : light })
            } else {
                self.system = color1
            }
            #elseif canImport(AppKit)
            self.system = .init(name: nil, dynamicProvider: { appearance in
                if appearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua {
                    return dark
                } else {
                    return light
                }
            })
            #endif
        }
        
        public func value() -> Color { return system }
        
        /// 十六进制色: 0x666666
        ///
        /// - Parameter RGBValue: 十六进制颜色
        private static func color(_ value: Int64) -> Color {
            var hex = value
            var count = 0
            
            while count <= 8, hex > 0 {
                hex = hex >> 4
                count += 1
                if count > 8 { break }
            }
            
            let divisor = 255.0
            
            if count <= 6 {
                return Color(red:   Double((value & 0xFF0000) >> 16) / divisor,
                             green: Double((value & 0x00FF00) >>  8) / divisor,
                             blue:  Double( value & 0x0000FF)        / divisor,
                             alpha: 1)
            } else if count <= 8 {
                let value = Int64(value)
                return Color(red:   Double((value & 0xFF000000) >> 24) / divisor,
                             green: Double((value & 0x00FF0000) >> 16) / divisor,
                             blue:  Double((value & 0x0000FF00) >>  8) / divisor,
                             alpha: Double( value & 0x000000FF) / divisor)
            } else {
                return Color.black
            }
        }
    #endif
    }
    """
        }
    }
    
}
