//
//  File.swift
//  
//
//  Created by linhey on 2022/7/20.
//

import Foundation
import Stem
import Logging

public struct FlutterImageCodeMaker: MissionInstance, XCMaker {
    
    public struct Options {
        let channels: [String]
        /// 检查每个 channel 文件夹下是否一致
        let check_consistency: Bool
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.channels = try await variables.parse(json["channels"].arrayValue.compactMap(\.string))
            self.check_consistency = json["check_consistency"].boolValue
        }
        
    }
    
    public var logger: Logger?
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        
    }
    
}
