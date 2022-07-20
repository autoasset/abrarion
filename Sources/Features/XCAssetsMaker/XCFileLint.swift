//
//  File.swift
//  
//
//  Created by linhey on 2022/6/30.
//

import Foundation
import Stem

struct XCFileLint {
    
    let name: String
    let pattern: NSRegularExpression
    
    init?(from json: JSON, variables: VariablesManager) async throws {
        guard let pattern = json["pattern"].string,
              let regex = try? NSRegularExpression(pattern: try await variables.parse(pattern)) else {
            return nil
        }
        self.name = try await variables.parse(json["name"].stringValue)
        self.pattern = regex
    }
    
}
