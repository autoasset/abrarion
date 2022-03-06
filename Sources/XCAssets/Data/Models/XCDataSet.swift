//
//  File.swift
//  
//
//  Created by linhey on 2022/3/4.
//

import Foundation
import Stem

/// https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/ImageSetType.html
struct XCDataSet {
    
    let name: String
    let ivar: String
    let datas: [XCData]    
    let info: Info
    
    internal init(name: String, ivar: String, datas: [XCData], info: Info = .xcode) {
        self.name = name
        self.ivar = ivar
        self.datas = datas
        self.info = info
    }
    
    init(contentFile json: JSON) async throws {
        self.name  = ""
        self.ivar  = ""
        self.info  = .init(from: json["info"])
        self.datas = json["data"].arrayValue.compactMap(XCData.init(from:))
    }
   
    var toJSON: [String: Any] {
        var dict = [String: Any]()
        dict["info"] = info.toJSON
        dict["data"] = datas.map(\.toJSON)
        return dict
    }
}
