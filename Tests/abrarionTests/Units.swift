//
//  File.swift
//  
//
//  Created by linhey on 2022/7/1.
//

import Foundation
import Combine

struct Units {
    
    static var cancellables = Set<AnyCancellable>()
    
    static var encoder = JSONEncoder()
    static var decoder = JSONDecoder()

    static func encode<T>(_ value: T) throws -> Data where T : Encodable {
       try encoder.encode(value)
    }
    
    static func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
       try decoder.decode(type, from: data)
    }
    
}
