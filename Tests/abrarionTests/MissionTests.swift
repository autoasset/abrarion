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
    
    class Mission: MissionInstance {
        var jsons = [JSON?]()
        func evaluate(from json: JSON?, context: MissionContext) async throws {
            self.jsons.append(json)
            print(json ?? "nil")
        }
    }
    
    func testExample() async throws {
        let manager = MissionManager()
        let mission = Mission()
        let task_name = "task_name"
        manager.register(mission, for: task_name)
        let json = """
        {
            "missions":[
                "task_name",
                {
                    "task_name":"task-forward"
                },
                {
                    "task_name":{
                        "id":0,
                        "inputs":"./"
                    }
                },
                {
                    "task_name":{
                        "inputs":"./"
                    }
                },
                {
                    "task_name":{
                        "inputs":"./",
                        "merge":[
                            "task-forward"
                        ]
                    }
                }
            ],
            "task-forward":{
                "forward-arg1":"forward-value1",
                "inputs":"inputs"
            }
        }
        """
        try await manager.run(from: JSON(parseJSON: json), context: .init())
        assert(mission.jsons[0] == nil)
        assert(mission.jsons[1]!.stringValue == "task-forward")
        assert(JSON(rawValue: mission.jsons[2]!.dictionaryValue.mapValues(\.object))! == ["id": 0, "inputs": "./"])
        assert(JSON(rawValue: mission.jsons[3]!.dictionaryValue.mapValues(\.object))! == ["inputs": "./"])
        assert(JSON(rawValue: mission.jsons[4]!.dictionaryValue.mapValues(\.object))! == ["inputs": "./", "forward-arg1": "forward-value1"])
    }
    
}
