//
//  File.swift
//  
//
//  Created by linhey on 2022/6/17.
//

import Foundation
import Logging

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
    public let desc: String?
    
    public init(key: String,
                desc: String? = nil,
                value: @escaping () async throws -> String) {
        self.key = key
        self.desc = desc
        self.value = value
    }
    
    public init(key: String, desc: String? = nil, value: String) {
        self.key = key
        self.desc = desc
        self.value = { value }
    }
}

public class VariablesManager {
    
    public init() {}
    
    var cache = [String: Variables]()
    let logger = Logger(label: "variables")

    public func register(_ variables: Variables) {
        cache[variables.matchKey] = variables
    }
    
    public func has(_ name: String) -> Bool {
        cache["${\(name)}"] != nil || cache[name] != nil
    }
    
    public func register(_ variables: [Variables]) {
        variables.forEach({ register($0) })
    }
    
    public func register(_ variables: Dictionary<String, Variables>.Values) {
        variables.forEach({ register($0) })
    }
    
    /// 解析带变量的文本
    public func parse(_ text: String) async throws -> String {
        var text = text
        while let variables = cache.first(where: { text.contains($0.key) })?.value {
            let value = try await variables.value()
            let key = variables.matchKey
            text = text.replacingOccurrences(of: key, with: value)
        }
        return text
    }
    
    public func parse(_ text: String?) async throws -> String? {
        guard let text = text else {
            return nil
        }
        return try await parse(text)
    }
    
    public func parse(_ text: [String]) async throws -> [String] {
        var new = [String]()
        for item in text {
            new.append(try await parse(item))
        }
        return new
    }
    
}
