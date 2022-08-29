//
//  File.swift
//  
//
//  Created by linhey on 2022/8/25.
//

import Stem
import StemFilePath

struct XCImageMark {
    
    /**
     https://developer.android.com/studio/write/resource-manager?hl=zh-cn
     https://developer.android.com/studio/write/vector-asset-studio?hl=zh-cn
     */
    enum Kind: Hashable {
        /// 倍率图, xx@1x.png | xx@2x.png
        case scale(Int)
        /// 未识别的缩放类型
        case unrecognisedScale
        case unrecognisedGIFScale
        case gif(Int)
        /// 矢量图
        case vector
        /// android xml 格式矢量图
        case android_vector
        /// 未知的文件格式
        case unknown
    }
    
    static func marked(_ file: STFile) -> Kind {
        guard let data = try? file.data() else {
            return .unknown
        }
        
        if let ext = file.attributes.nameComponents.extension {
            switch ext {
            case "svg":
                return .vector
            case "xml":
                return .android_vector
            default:
                break
            }
        }
        
        guard let type = data.st.mimeType else {
            return .unknown
        }
        
        switch type {
        case .gif:
            guard let str = file.attributes.nameComponents.name.split(separator: "@").last?.dropLast().description,
                  let scale = Int(str) else {
                return .unrecognisedGIFScale
            }
            return .gif(scale)
        case .pdf:
            return .vector
        case .png, .jpeg:
            guard let str = file.attributes.nameComponents.name.split(separator: "@").last?.dropLast().description,
                  let scale = Int(str) else {
                return .unrecognisedScale
            }
            return .scale(scale)
        default:
            return .unknown
        }
    }
    
    static func marked(_ files: Set<STFile>) -> [Kind: Set<STFile>] {
        var store = [Kind: Set<STFile>]()
        func add(_ file: STFile) {
            let kind = marked(file)
            if store[kind] == nil {
                store[kind] = .init()
            }
            store[kind]?.update(with: file)
        }
        
        files.forEach(add(_:))
        return store
    }
    
    /// 没有倍率标识的文件名
    static func filename(noScaleFactor file: STFile) -> String {
        return [file.attributes.nameComponents.name
            .split(separator: "@")
            .dropLast()
            .joined(separator: "@"),
                file.attributes.nameComponents.extension]
            .compactMap({ $0 })
            .joined(separator: ".")
    }
    
}
