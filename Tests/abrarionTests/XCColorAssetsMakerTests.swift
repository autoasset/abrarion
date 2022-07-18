//
//  XCAssetsMakerTests.swift
//  
//
//  Created by linhey on 2022/6/17.
//

import XCTest
import Features
import Stem
import StemFilePath

class XCColorAssetsMakerTests: XCTestCase {

    public struct ColorJSONModeOptions: Codable {
        
        struct Template: Codable {
            var list_protocol_name = "ListProtocolName"
            var instance_name = "InstanceName"
            var instance_protocol_name = "InstanceProtocolName"
            var list_output_path = "~/Downloads/Tests/list.swift"
            var instance_output_path = "~/Downloads/Tests/color-core.swift"
            var bundle_name = "bundle_name"
        }
        
        var template = Template()
        var inputs = ["~/Downloads/Tests/inputs"]
        var output = "~/Downloads/Tests/output"
    }
    
    let jsonEncoder = JSONEncoder()
    let workFolder = try! STFolder("~/Downloads/Tests")

    func testColorMaker() async throws {
        try workFolder.delete()
        
        let list1 = """
        [
            {"注释": "紫 Purple"},
            {"names": ["N1", "P1"], "any": "#f1ebff" },
            {"names": ["N2", "P2"], "any": "#9d81d6" },
            {"names": ["N3", "P3"], "any": "#8c67d6" },
            {"names": ["N4", "P4"], "any": "#7b4dd6" },
            {"names": ["N5", "P5"], "any": "#583799" },
            {"names": ["N6", "P6"], "any": "#35215c" },

            {"注释": "橙 Orange"},
            {"names": ["O1"], "any": "#faefe6", "dark": "#f0a360" },
            {"names": ["O2"], "any": "#f0a360", "dark": "#faefe6" },
            {"names": ["O3"], "any": "#f08f3a", "dark": "#f07a13" },
            {"names": ["O4"], "any": "#f07a13", "dark": "#f08f3a" },
            {"names": ["O5"], "any": "#b35b0e", "dark": "#753c09" },
            {"names": ["O6"], "any": "#753c09", "dark": "#b35b0e" },

            {"注释": "蓝 Blue"},
            {"names": [], "any": "#eaf0ff" },
            {"names": [], "any": "#7191eb" },
            {"names": [], "any": "#547ceb" },
            {"names": [], "any": "#3663e0" },
            {"names": [], "any": "#2748a3" },
            {"names": [], "any": "#182d66" }
        ]
        """
        try workFolder
            .folder(name: "inputs").create()
            .file(name: "list1.json").create(with: list1.data(using: .utf8))
        
        let maker = XCColorMaker()
        let options = try XCColorMaker.JSONModeOptions(from: JSON(data: jsonEncoder.encode(ColorJSONModeOptions())))
        try await maker.evaluate(options: options)
    }

}
