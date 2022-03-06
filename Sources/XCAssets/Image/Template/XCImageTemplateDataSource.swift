//
//  File.swift
//  
//
//  Created by linhey on 2022/3/6.
//

import Foundation
import Stem

class XCImageTemplateDataSource {
    
    let model: XCImageTemplate
    let images: [XCImageSet]
    
    init(model: XCImageTemplate, images: [XCImageSet]) {
        self.model = model
        self.images = images
    }
    
    var `protocol`: String {
        return """
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public protocol \(model.protocolName) {
    init(named: String, in bundle: String?)
    #if canImport(UIKit)
    func value() -> UIImage
    #elseif canImport(AppKit)
    func value() -> NSImage
    #endif
}
"""
    }
    
    var extensionProtocol: String {
"""
public extension \(model.protocolName) {
\(content)
}
"""
    }
    
    var content: String {
        let formatter = VariableFormatter(style: .camelCased)
        return images
            .map({ item -> String in
                let name = formatter.string(item.ivar)
                return "static var \(name): Self { .init(named: \"\(item.name)\", in: \(model.bundleName == nil ? "nil" : "\"\(model.bundleName!)\"")) }"
            })
            .sorted()
            .map({ "  \($0)" })
            .joined(separator: "\n")
    }
    
    var conform: String {
        "extension \(model.instanceName): \(model.protocolName) {}"
    }
    
    var instance: String {
"""
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public class \(model.instanceName) {
    
    public let named: String
    public let bundle: String?
    
    required public init(named: String, in bundle: String?) {
        self.named = named
        self.bundle = bundle
    }
    
    #if canImport(UIKit)
    public func value() -> UIImage {
        guard let name = bundle,
              let image = UIImage(named: named, in: Bundle.module(name: name), compatibleWith: nil) else {
            guard let image = UIImage(named: named) else {
                assertionFailure("can't find image: \\(named) in bundle: \(model.bundleName ?? "main")")
                return UIImage()
            }
            return image
        }
        
        return image
    }
    
    #elseif canImport(AppKit)
    public func value() -> NSImage {
        guard let name = bundle, let image = Bundle.module(name: name).image(forResource: named) else {
            guard let image = NSImage(named: named) else {
                assertionFailure("can't find image: \\(named) in bundle: \(model.bundleName ?? "main")")
                return NSImage()
            }
            return image
        }
        return image
    }
    #endif
}
"""
    }
    
}
