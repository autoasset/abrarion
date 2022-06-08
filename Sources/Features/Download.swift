//
//  File.swift
//  
//
//  Created by linhey on 2022/6/8.
//

import Foundation
import Stem
import StemFilePath

/**
 
 {
 "download":{
 "target":{
 "folder":""
 },
 "items":[
 {
 "uri":"",
 "target":{
 "folder":"",
 "name":""
 }
 }
 ]
 }
 }
 
 */

public struct Download {
    
    public struct Target: Equatable {
        
        public static let none = Target(name: nil, folder: "")
        
        /// 下载的文件名/文件夹名
        public let name: String?
        /// 下载到具体的文件夹
        public let folder: String
        
        init(name: String?, folder: String) {
            self.name = name
            self.folder = folder
        }
        
        public init?(from: JSON) {
            self.name = from["name"].string
            self.folder = from["folder"].stringValue
            if self.folder.isEmpty {
                return nil
            }
        }
    }
    
    public struct Item {
        /// 资源链接
        public let uri: String
        /// 下载目标位置
        public fileprivate(set) var target: Target
        
        public init?(from: JSON) {
            self.uri = from["uri"].stringValue
            self.target = .init(from: from["target"]) ?? .none
            if self.uri.isEmpty {
                return nil
            }
        }
    }
    
    public let items: [Item]
    
    public init(from: JSON) {
        let target = Target(from: from["target"]) ?? Target.none
        self.items = from["items"].arrayValue
            .compactMap(Item.init(from:))
            .map({ item in
                guard item.target == .none else {
                    return item
                }
                var item = item
                item.target = target
                return item
            })
            .filter({ item in
                item.target != .none
            })
    }
    
}
