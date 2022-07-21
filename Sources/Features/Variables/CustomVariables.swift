//
//  File.swift
//  
//
//  Created by linhey on 2022/7/21.
//

import Stem
import StemFilePath
import Logging

struct CustomVariables: MissionInstance {
    
    struct Options {
        
        public init(from json: JSON, variables: VariablesManager) async throws {

        }
        
    }
    
    var logger: Logger?
        
    func evaluate(from json: JSON, context: MissionContext) async throws {
        
    }
    
}
