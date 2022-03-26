//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem
import SwiftUI

struct XCImagesetController {
    
    typealias Output = [OutputType<[String: [OutputImageItem]], [String: [OutputSymbolItem]]>]
    
    enum OutputType<Image, Symbol> {
        case image(Image)
        case symbol(Symbol)
    }
    
    enum FileType {
        case normal
        case vector
        case symbol
    }
    
    struct OutputSymbolItem {
        let symbol: XCSymbol
        let item: ValidateItem
    }
    
    struct OutputImageItem {
        let image: XCImage
        let item: ValidateItem
    }
    
    struct ValidateItem {
        let type: FileType
        let file: FilePath.File
    }
    
}

extension XCImagesetController {
    
    static func validate(file: FilePath.File) throws -> ValidateItem? {
        if file.attributes.name.lowercased().hasSuffix(".svg") {
            let data = try file.data()
            if let content = String(data: data, encoding: .utf8),
               content.contains("\"Notes\""),
               content.contains("\"Guides\""),
               content.contains("\"Symbols\""),
               content.contains("\"Black-S\""),
               content.contains("\"Regular-S\""),
               content.contains("\"Ultralight-S\"") {
                return .init(type: .symbol, file: file)
            } else {
                return .init(type: .vector, file: file)
            }
        }
        switch try file.data().st.mimeType {
        case .png, .jpeg:
            return .init(type: .normal, file: file)
        case .pdf:
            return .init(type: .vector, file: file)
        default:
            return nil
        }
    }
    
    static func output(from files: [FilePath.File], darkModePatterns: [XCImageConfig.DarkModePattern]) async throws -> Output {
        
        var imageSets = [String: [OutputImageItem]]()
        var symbolSets = [String: [OutputSymbolItem]]()
        
        func append(item: ValidateItem, for name: String, isDarkMode: Bool) {
            let filename = item.file.attributes.name
            var scale: XCImageScale?
            
            if filename.contains("@3x.") {
                scale = .x3
            } else if filename.contains("@2x.") {
                scale = .x2
            } else if filename.contains("@1x.") {
                scale = .x1
            }
            
            switch item.type {
            case .vector, .normal:
                let image = XCImage(filename: filename,
                                    appearances: isDarkMode ? [.luminosity(.dark)] : [],
                                    scale: scale)
                let item = OutputImageItem(image: image, item: item)
                if imageSets[name] != nil {
                    imageSets[name]?.append(item)
                } else {
                    imageSets[name] = [item]
                }
            case .symbol:
                let symbol = XCSymbol(filename: filename,
                                      appearances: isDarkMode ? [.luminosity(.dark)] : [],
                                      direction: nil)
                let item = OutputSymbolItem(symbol: symbol, item: item)
                if symbolSets[name] != nil {
                    symbolSets[name]?.append(item)
                } else {
                    symbolSets[name] = [item]
                }
            }
        }
        
        for file in files {
            guard let item = try validate(file: file),
                  let name = file
                .attributes.name
                .split(separator: "@").first?
                .split(separator: ".").dropLast()
                .joined(separator: ".") else {
                continue
            }
            var isAppend = false
            
            for pattern in darkModePatterns {
                switch pattern {
                case .prefix(pattern: let pattern):
                    guard name.hasPrefix(pattern) else {
                        continue
                    }
                    let name2 = name.st.deleting(prefix: pattern)
                    if name2.isEmpty {
                        throw StemError(code: 1, message: "\(name) 在 darkMode.prefix(pattern: \(pattern)) 下匹配内容为空")
                    }
                    append(item: item, for: name2, isDarkMode: true)
                    isAppend = true
                case .suffix(pattern: let pattern):
                    guard name.hasSuffix(pattern) else {
                        continue
                    }
                    let name2 = name.st.deleting(prefix: pattern)
                    if name2.isEmpty {
                        throw StemError(code: 1, message: "\(name) 在 darkMode.suffix(pattern: \(pattern)) 下匹配内容为空")
                    }
                    append(item: item, for: name2, isDarkMode: true)
                    isAppend = true
                case .regex(pattern: let pattern):
                    guard let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive]) else {
                        continue
                    }
                    
                    let match = regex.matches(in: name,
                                              options: [.withoutAnchoringBounds],
                                              range: .init(location: 0, length: (name as NSString).length))
                    
                    if match.isEmpty { continue }
                    
                    let name2 = match.map(\.range).map({ (name as NSString).substring(with: $0) }).joined()
                    append(item: item, for: name2, isDarkMode: true)
                    isAppend = true
                }
            }
            
            if isAppend == false {
                append(item: item, for: name, isDarkMode: false)
            }
            
            
        }
        return [.image(imageSets), .symbol(symbolSets)]
    }
    
    static func contentFile(from imageSet: XCImageSet) async throws -> Data {
        return try JSONSerialization.data(withJSONObject: imageSet.toJSON, options: [.prettyPrinted, .sortedKeys])
    }
    
    static func contentFile(from imageSet: XCImageSymbolSet) async throws -> Data {
        return try JSONSerialization.data(withJSONObject: imageSet.toJSON, options: [.prettyPrinted, .sortedKeys])
    }
}
