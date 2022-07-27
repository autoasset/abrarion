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
    let workFolder = STFolder("~/Downloads/Tests")
    
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
        let options = try await XCColorMaker.Options(from: JSON(data: jsonEncoder.encode(ColorJSONModeOptions())), variables: .init())
        try await maker.evaluate(options: options)
    }
    
    func test_createJSON() throws {
        let colors = [
            "purplr":   ["F6F2FF","E6DCFF","CDBAFF","B197FF","9B7DFF","7753FF","5A3CDB","4329B7","3918A8","31118A"],
            "orange":   ["FFF9ED","FEEFCF","FDDAA0","FABF70","F6A44C","F07A13","CE5D0D","AC4409","8B2E06","731F03"],
            "blue":     ["ECF3FF","D6E5FD","AFC9FB","85A9F5","658DEC","3663E0","274BC0","1B37A1","112581","0A196B"],
            "green":    ["EFFFF1","D5FBDA","ACFABD","7FE9A2","5BD48F","2CB876","209E6F","168466","0E6A5A","085852"],
            "red":      ["FFF5EF","FEE5D7","FDC6AF","F99E87","F96C5A","E3443F","CA2831","A91C2F","88112C","700A29"],
            "brown":    ["FFF8EF","FCEED9","F4D9B0","F0C483","DFAD63","BD8C44","A27031","885622","6D3F15","5A2E0D"],
            "skyblue":  ["EEFAFC","D9F4FF","B3E6FF","8DD4FF","71C2FF","42A4FF","3080DB","215FB7","154393","0C2E7A"],
            "n":        ["FFFFFF","F7F7F7","F0F0F0","E8E8E8","E0E0E0","CCCCCC","999999","666666","333333","000000"],
        ]
        let other = ["F5F6F9", "2A2624", "423D38"]
        
        var json: [[String: Any]] = colors.map { item in
            item.value.enumerated().map { element in
                [
                    "names": ["\(item.key)_\(element.offset + 1)", "_\(element.element.uppercased())"],
                    "any":  "#\(element.element.uppercased())",
                    "dark": "#\(element.element.uppercased())",
                ]
            }
        }
            .flatMap({ $0 })
        
        json.append(contentsOf: other.map { item in
            [
                "names": ["_\(item)"],
                "any":  "#\(item)",
                "dark": "#\(item)",
            ]
        })
        
        let data = try JSONSerialization.data(withJSONObject: json, options: [.sortedKeys, .withoutEscapingSlashes, .fragmentsAllowed])
        let str = String(data: data, encoding: .utf8)?
        .replacingOccurrences(of: "},{", with: "},\n{")
        try STFile("/Users/linhey/Desktop/dxyer-assets/.developer/colors/common/年轻化色值表.json").overlay(with: str?.data(using: .utf8))
    }
    
}
