//
//  File.swift
//  
//
//  Created by linhey on 2022/6/17.
//

import Foundation

public protocol VariablesProtocol {
    var key: String { get }
    var value: () async throws -> String { get }
}

extension VariablesProtocol {
    var matchKey: String { "${\(key)}" }
}

public struct Variables: VariablesProtocol {
    
    public let key: String
    public let value: () async throws -> String
    
    public init(key: String, value: @escaping () async throws -> String) {
        self.key = key
        self.value = value
    }
    
    public init(key: String, value: String) {
        self.key = key
        self.value = { value }
    }
}

public class VariablesManager {
    
    public init() {}
    
    var cache = [String: VariablesProtocol]()
    
    public func register(_ variables: VariablesProtocol) {
        cache[variables.matchKey] = variables
    }
    
    /// 解析带变量的文本
    public func parse(_ text: String) async throws -> String {
        var text = text
        while let variables = cache.first(where: { text.contains($0.key) })?.value {
            text = text.replacingOccurrences(of: variables.matchKey, with: try await variables.value())
        }
        return text
    }
    
    public func parse(_ text: [String]) async throws -> [String] {
        var new = [String]()
        for item in text {
            new.append(try await parse(item))
        }
        return new
    }
    
}
