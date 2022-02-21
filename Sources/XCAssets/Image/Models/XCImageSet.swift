//
//  File.swift
//
//
//  Created by linhey on 2022/2/9.
//

import Foundation
import Stem

/// https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/ImageSetType.html
struct XCImageSet {
    
    struct Properties {
        
        let renderAs: XCImageRenderAs?
        let compressionType: XCImageCompressionType?
        let preservesVectorRepresentation: Bool
        let onDemandResourceTags: [String]
        let autoScaling: Bool
        let localizable: Bool

        init(from json: JSON) {
            renderAs = .init(from: json)
            compressionType = .init(from: json)
            onDemandResourceTags = json["on-demand-resource-tags"].arrayValue.compactMap(\.string)
            preservesVectorRepresentation = json["preserves-vector-representation"].boolValue
            autoScaling = json["auto-scaling"].stringValue == "auto"
            localizable = json["localizable"].boolValue
        }
        
        var toJSON: [String: Any] {
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
    
    let names: [String]
    let ivars: [String]
    let images: [XCImage]
    
    let properties: Properties
    let info: Info
    
    init(names: [String],
         ivars: [String],
         images: [XCImage],
         properties: Properties,
         info: Info = .xcode) {
        self.names = names
        self.images = images
        self.properties = properties
        self.info = info
        self.ivars = ivars
    }
    
    init(contentFile json: JSON) async throws {
        self.names = []
        self.ivars = []
        self.properties = Properties.init(from: json["properties"])
        self.info = .init(from: json["info"])
        self.images = json["images"].arrayValue.map(XCImage.init(json:))
    }
   
}
