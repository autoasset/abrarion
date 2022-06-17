//
//  MissionTests.swift
//  
//
//  Created by linhey on 2022/6/17.
//

import XCTest
import Stem
import Features

final class MissionTests: XCTestCase {
    
    struct Mission: MissionInstance {
        
        func evaluate(from json: JSON?) async throws {
            guard let json = json else {
                return
            }
            print(json)
        }
        
    }
    
    func testExample() async throws {
        let manager = MissionManager()
        let mission = Mission()
        manager.register(mission, for: "task")
        let json = """
        {
          "missions": [
            "task",
            {
              "task": "task-forward"
            },
            {
              "task": {
                  "inputs": "./"
                }
            }
          ],
        "task-forward": "forward"
        }
        """
        try await manager.run(from: JSON(parseJSON: json))
    }
    
}
