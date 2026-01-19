//
//  HarmonyOSColorDiffTests.swift
//
//
//  Created by linhey on 2026/1/19.
//

import Foundation
import XCTest

@testable import Features

final class HarmonyOSColorDiffTests: XCTestCase {

    // MARK: - Models

    struct ColorItem: Codable, Equatable {
        let name: String
        let value: String
    }

    struct ColorResource: Codable {
        let color: [ColorItem]
    }

    enum ColorDifference {
        case added(ColorItem)
        case removed(ColorItem)
        case modified(old: ColorItem, new: ColorItem)
    }

    // MARK: - Test Methods

    /// 比对两个 HarmonyOS 颜色 JSON 文件的差异
    /// - Parameters:
    ///   - oldJsonPath: 旧的 JSON 文件路径
    ///   - newJsonPath: 新的 JSON 文件路径
    func testColorDifference() throws {
        // 示例用法：
         let oldPath = "/path/to/old/color.json"
         let newPath = "/path/to/new/color.json"
         let differences = try compareColorFiles(oldPath: oldPath, newPath: newPath)
         printDifferences(differences)
    }

    // MARK: - Helper Methods

    /// 比对两个颜色 JSON 文件
    func compareColorFiles(oldPath: String, newPath: String) throws -> [ColorDifference] {
        let oldData = try Data(contentsOf: URL(fileURLWithPath: oldPath))
        let newData = try Data(contentsOf: URL(fileURLWithPath: newPath))

        let decoder = JSONDecoder()
        let oldResource = try decoder.decode(ColorResource.self, from: oldData)
        let newResource = try decoder.decode(ColorResource.self, from: newData)

        return compareColors(old: oldResource.color, new: newResource.color)
    }

    /// 比对两个颜色数组
    func compareColors(old: [ColorItem], new: [ColorItem]) -> [ColorDifference] {
        var differences: [ColorDifference] = []

        // 创建字典以便快速查找
        let oldDict = Dictionary(uniqueKeysWithValues: old.map { ($0.name, $0) })
        let newDict = Dictionary(uniqueKeysWithValues: new.map { ($0.name, $0) })

        // 查找删除和修改的颜色
        for (name, oldColor) in oldDict {
            if let newColor = newDict[name] {
                if oldColor.value != newColor.value {
                    differences.append(.modified(old: oldColor, new: newColor))
                }
            } else {
                differences.append(.removed(oldColor))
            }
        }

        // 查找新增的颜色
        for (name, newColor) in newDict {
            if oldDict[name] == nil {
                differences.append(.added(newColor))
            }
        }

        return differences
    }

    /// 打印差异信息
    func printDifferences(_ differences: [ColorDifference]) {
        guard !differences.isEmpty else {
            print("✅ 没有发现颜色差异")
            return
        }

        print("发现 \(differences.count) 个颜色差异:\n")

        var added: [ColorItem] = []
        var removed: [ColorItem] = []
        var modified: [(old: ColorItem, new: ColorItem)] = []

        for diff in differences {
            switch diff {
            case .added(let color):
                added.append(color)
            case .removed(let color):
                removed.append(color)
            case .modified(let old, let new):
                modified.append((old, new))
            }
        }

        if !added.isEmpty {
            print("➕ 新增颜色 (\(added.count)):")
            for color in added.sorted(by: { $0.name < $1.name }) {
                print("  + \(color.name): \(color.value)")
            }
            print()
        }

        if !removed.isEmpty {
            print("➖ 删除颜色 (\(removed.count)):")
            for color in removed.sorted(by: { $0.name < $1.name }) {
                print("  - \(color.name): \(color.value)")
            }
            print()
        }

        if !modified.isEmpty {
            print("🔄 修改颜色 (\(modified.count)):")
            for (old, new) in modified.sorted(by: { $0.old.name < $1.old.name }) {
                print("  ~ \(old.name):")
                print("    旧值: \(old.value)")
                print("    新值: \(new.value)")
            }
            print()
        }
    }

    // MARK: - Example Tests

    /// 测试颜色比对逻辑（使用模拟数据）
    func testColorComparisonLogic() throws {
        let oldColors = [
            ColorItem(name: "red_1", value: "#FF0000"),
            ColorItem(name: "blue_1", value: "#0000FF"),
            ColorItem(name: "green_1", value: "#00FF00"),
        ]

        let newColors = [
            ColorItem(name: "red_1", value: "#FF0000"),  // 未变化
            ColorItem(name: "blue_1", value: "#0000EE"),  // 修改
            ColorItem(name: "yellow_1", value: "#FFFF00"),  // 新增
            // green_1 被删除
        ]

        let differences = compareColors(old: oldColors, new: newColors)

        // 验证结果
        XCTAssertEqual(differences.count, 3, "应该有3个差异")

        // 统计各类型差异
        var addedCount = 0
        var removedCount = 0
        var modifiedCount = 0

        for diff in differences {
            switch diff {
            case .added:
                addedCount += 1
            case .removed:
                removedCount += 1
            case .modified:
                modifiedCount += 1
            }
        }

        XCTAssertEqual(addedCount, 1, "应该有1个新增颜色")
        XCTAssertEqual(removedCount, 1, "应该有1个删除颜色")
        XCTAssertEqual(modifiedCount, 1, "应该有1个修改颜色")

        // 打印差异（可选）
        print("\n--- 测试示例差异 ---")
        printDifferences(differences)
    }
}
