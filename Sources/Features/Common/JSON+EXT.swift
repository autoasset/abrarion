//
//  File.swift
//  
//
//  Created by linhey on 2022/8/29.
//

import Foundation
import Stem
import STJSON

extension JSON {
    
    var stringArrayValue: [String] {
        var items = self.arrayValue
            .compactMap(\.string)
        
        if items.isEmpty, let item = self.string {
            items = [item]
        }
        
        return items
    }
    
}
