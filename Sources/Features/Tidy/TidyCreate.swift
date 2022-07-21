//
//  File.swift
//  
//
//  Created by linhey on 2022/7/21.
//

import Stem
import Foundation
import StemFilePath
import Logging

public struct TidyCreate: MissionInstance {
    public var logger: Logger?
    
    public enum CreateInput {
        case text(String)
        case input(STFile)
    }
    
    public struct Options {
        public let input: CreateInput
        var output: STFile
        
        init(from json: JSON, variables: VariablesManager) async throws {
            output = try await STFile(variables.parse(json["output"].stringValue))
            if let item = json["input"].string {
                input = .input(STFile(try await variables.parse(item)))
            } else if let item = json["text"].string {
                input = .text(try await variables.parse(item))
            } else {
                throw StemError(message: "TidyCreate: 参数解析错误")
            }
        }
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        logger?.info(.init(stringLiteral: context.relativePath(options.output)))
        let data: Data?
        switch options.input {
        case .input(let file):
            if let text = String(data: try file.data(), encoding: .utf8) {
                data = try await context.variables.parse(text).data(using: .utf8)
            } else {
                data = .init()
            }
        case .text(let text):
            data = try await context.variables.parse(text).data(using: .utf8)
        }
        try options.output.overlay(with: data)
    }
    
    public init() {}
}
