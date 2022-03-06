//
//  File.swift
//  
//
//  Created by linhey on 2022/3/6.
//

import Foundation
import Stem
import Core

struct XCInputPaths {

    let xcassets: String
    let template: String?
    let codes: String?
    let contents: [String]
    let sources: [String]
    
    init(xcassets: String,
         template: String? = nil,
         codes: String? = nil,
         contents: [String] = [],
         sources: [String] = []) {
        self.xcassets = xcassets
        self.template = template
        self.codes = codes
        self.contents = contents
        self.sources = sources
    }
    
    init(from json: JSON) throws {
        guard let xcassets = json["xcassets"].string else {
            throw ParsableCommandError.parsableFail
        }
        self.xcassets = xcassets
        self.codes = json["codes"].string
        self.template = json["template"].string
        self.sources = json["sources"].arrayValue.compactMap(\.string)
        self.contents = json["contents"].arrayValue.compactMap(\.string)

        if self.sources.isEmpty {
            throw ParsableCommandError.parsableFail
        }
    }
    
}
