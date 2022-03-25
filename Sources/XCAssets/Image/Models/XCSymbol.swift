//
//  File.swift
//  
//
//  Created by linhey on 2022/3/17.
//

import Foundation
import Stem

struct XCSymbol {

    let filename: String?
    let devices: Devices = .init(idiom: .universal)
    let direction: XCImageDirection?
    let appearances: [Appearance]

    init(filename: String?, appearances: [Appearance], direction: XCImageDirection?) {
        self.filename = filename
        self.direction = direction
        self.appearances = appearances
    }
    
    init?(from json: JSON) {
        filename = json["filename"].string
        direction = .init(from: json)
        appearances = .init(from: json["appearances"])
    }
    
    var toJSON: [String: Any] {
        var dict = [String: Any]()
        dict["filename"] = filename
        dict.merge(devices.toJSON, uniquingKeysWith: { $1 })
        dict.merge(direction?.toJSON ?? [:], uniquingKeysWith: { $1 })
        if appearances.isEmpty == false {
            dict["appearances"] = appearances.map(\.toJSON)
        }
        return dict
    }
    
}
