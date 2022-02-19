//
//  File.swift
//  
//
//  Created by linhey on 2022/2/4.
//

import Foundation
import Abrarion
import XCTest

final class BaseTests: AbrarionTests {
   
    func testVersion() throws {
        XCTAssert(try runApp(bash: "--version") == Abrarion.configuration.version)
    }
    
}
