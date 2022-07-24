//
//  File.swift
//  
//
//  Created by linhey on 2022/7/24.
//

import Foundation
import Logging
import Stem

public struct PrintVariables: MissionInstance {
    
   public var logger: Logger?
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
       try await context.variables.cache
            .values
            .sorted(by: { $0.key < $1.key })
            .asyncForEach { item in
           let value = try await context.variables.parse(item.matchKey)
            logger?.info(.init(stringLiteral: "[\(item.key)]: \(value)"))
        }
    }
    
   public init() {}
    
}
