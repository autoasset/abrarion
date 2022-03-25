//
//  File.swift
//  
//
//  Created by linhey on 2022/3/17.
//

import Foundation
import Stem

struct XCImageSymbolSet {
    
    let name: String
    let ivar: String
    let symbols: [XCSymbol]
    let info: Info
    
    internal init(name: String, ivar: String, symbols: [XCSymbol], info: Info = .xcode) {
        self.name = name
        self.ivar = ivar
        self.symbols = symbols
        self.info = info
    }
    
    init(contentFile json: JSON) async throws {
        self.name  = ""
        self.ivar  = ""
        self.info  = .init(from: json["info"])
        self.symbols = json["symbols"].arrayValue.compactMap(XCSymbol.init(from:))
    }
   
    var toJSON: [String: Any] {
        var dict = [String: Any]()
        dict["info"] = info.toJSON
        dict["symbols"] = symbols.map(\.toJSON)
        return dict
    }
}
