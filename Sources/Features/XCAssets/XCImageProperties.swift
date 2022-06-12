//
//  File.swift
//
//
//  Created by linhey on 2022/2/9.
//

import Foundation
import Stem

/// https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/ImageSetType.html
public struct XCImageProperties {
    
    public let renderAs: XCImageRenderAs?
    public let compressionType: XCImageCompressionType?
    public let preservesVectorRepresentation: Bool
    public let onDemandResourceTags: [String]
    public let autoScaling: Bool
    public let localizable: Bool
    
    public init(renderAs: XCImageRenderAs? = nil,
         compressionType: XCImageCompressionType? = nil,
         preservesVectorRepresentation: Bool = false,
         onDemandResourceTags: [String] = [],
         autoScaling: Bool = false,
         localizable: Bool = false) {
        self.renderAs = renderAs
        self.compressionType = compressionType
        self.preservesVectorRepresentation = preservesVectorRepresentation
        self.onDemandResourceTags = onDemandResourceTags
        self.autoScaling = autoScaling
        self.localizable = localizable
    }

    public init(from json: JSON) {
        renderAs = .init(from: json)
        compressionType = .init(from: json)
        onDemandResourceTags = json["on-demand-resource-tags"].arrayValue.compactMap(\.string)
        preservesVectorRepresentation = json["preserves-vector-representation"].boolValue
        autoScaling = json["auto-scaling"].stringValue == "auto"
        localizable = json["localizable"].boolValue
    }
    
    public var toJSON: [String: Any] {
        var dict = [String: Any]()
        if let item = renderAs {
            dict.merge(item.toJSON, uniquingKeysWith: { $1 })
        }
        if let item = compressionType {
            dict.merge(item.toJSON, uniquingKeysWith: { $1 })
        }
        if localizable {
            dict["localizable"] = true
        }
        if preservesVectorRepresentation {
            dict["preserves-vector-representation"] = true
        }
        if autoScaling {
            dict["auto-scaling"] = "auto"
        }
        if onDemandResourceTags.isEmpty == false {
            dict["on-demand-resource-tags"] = onDemandResourceTags
        }
        return dict
    }
    
}
