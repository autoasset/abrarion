//
//  File.swift
//  
//
//  Created by linhey on 2023/9/20.
//

import Stem
import STJSON
import StemColor
import Foundation
import STFilePath
import Logging

public struct TidySize: MissionInstance {
    
    public var logger: Logger?
    
    public struct Options {
        var inputs: [STPath]
        var variable: String
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            self.variable = try await variables.parse(json["variable"].stringValue)
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
        var files = [STFile]()
        for input in options.inputs {
            switch input.referenceType {
            case .file(let file):
                files.append(file)
            case .folder(let folder):
                let paths = try folder.allSubFilePaths([.skipsHiddenFiles]).compactMap(\.asFile)
                files.append(contentsOf: paths)
            case .none:
                break
            }
        }
        let size = files.map(\.attributes.size).reduce(0, { $0 + $1 })
        let formatter = ByteCountFormatter()
        
        context.variables.register(.init(key: options.variable, value: formatter.string(fromByteCount: Int64(size))))
    }
    
    public init() {}

}
