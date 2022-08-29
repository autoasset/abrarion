//
//  File.swift
//  
//
//  Created by linhey on 2022/8/29.
//

import Foundation
import Stem

public struct XCInputsOptions {
    
    let inputs: [String]
    let file_tags: XCFileTags?
    
    public init(from json: JSON, variables: VariablesManager) async throws {
        self.inputs = try await variables.parse(json["inputs"].stringArrayValue)
        self.file_tags = try await XCFileTags(from: json, variables: variables)
    }
    
    public init(inputs: [String]) {
        self.inputs = inputs
        self.file_tags = nil
    }

    public init(file_tags: XCFileTags) {
        self.inputs = []
        self.file_tags = file_tags
    }
    
}
