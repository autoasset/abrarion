//
//  File.swift
//  
//
//  Created by linhey on 2023/9/11.
//
import Stem
import STJSON
import Foundation
import STFilePath
import Logging

public struct KhalaReportInspection: MissionInstance {
    public var logger: Logger?
    
    struct Model: Codable {
        
        struct ReportError: Codable {
            let path: String
            let message: String
        }
        
        struct FileLint: Codable {
            let name: String
            let pattern: String
            let paths: [String]
        }
        
        let fileLints: [FileLint]
        let errors: [ReportError]?
        let duration: Double
        
    }
    
    public struct Options {
        var inputs: [STPath]

        init(from json: JSON, variables: VariablesManager) async throws {
            if let item = json["inputs"].string {
                self.inputs = [STPath(try await variables.parse(item))]
            } else {
                self.inputs = try await variables.parse(json["inputs"].arrayValue.map(\.stringValue))
                    .map(STPath.init)
            }
        }
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let models = try options.inputs
            .compactMap(\.asFile)
            .map({ try $0.data() })
            .map { data in
                try JSONDecoder().decode(Model.self, from: data)
            }
        
        var dict = [String: [String]]()
        models
            .compactMap(\.errors)
            .flatMap({ $0 })
            .forEach { error in
                if dict[error.message] == nil {
                    dict[error.message] = []
                }
                dict[error.message]?.append(error.path)
            }
        
       let messages = dict.map { (key, value) in
           "- " + key + "\n" + value.map({ "    ☞ \($0)" }).joined(separator: "\n")
        }
        
        if !messages.isEmpty {
            throw StemError(messages.joined(separator: "\n"))
        }
    }
    
    public init() {}
}
