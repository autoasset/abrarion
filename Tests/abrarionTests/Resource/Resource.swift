//
//  File.swift
//  
//
//  Created by linhey on 2022/5/30.
//

#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif

struct Resource {
    
    static func data(for name: String) -> Data {
        NSDataAsset(name: name, bundle: .module)!.data
    }

    static var color: String { String(data: data(for: "color.json"), encoding: .utf8)! }
    static var symbol: String { String(data: data(for: "symbol.json"), encoding: .utf8)! }

    static var testImageZip: Data { data(for: "test_image.zip") }
    static var iconfontZip: Data { data(for: "iconfont.zip") }

}
