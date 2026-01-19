//
//  File.swift
//
//
//  Created by linhey on 2026/1/19.
//

import Foundation
import Logging
import STFilePath
import STJSON
import Stem

public struct HarmonyOSColorMaker: MissionInstance {

    // MARK: - Models

    struct ColorItem: Codable {
        let name: String
        let value: String
    }

    struct ColorResource: Codable {
        let color: [ColorItem]
    }

    // MARK: - Options

    public struct Options {

        /// 当颜色色值为Hex形式时所添加的前缀
        var color_prefix_when_name_is_hex: String
        let inputs: [String]
        let output: STFile

        public init(from json: JSON, variables: VariablesManager) async throws {
            let color_prefix_when_name_is_hex = try await variables.parse(
                json["color_prefix_when_name_is_hex"].stringValue)
            if color_prefix_when_name_is_hex.isEmpty {
                self.color_prefix_when_name_is_hex = "c_"
            } else {
                self.color_prefix_when_name_is_hex = color_prefix_when_name_is_hex
            }
            self.output = try await STFile(variables.parse(json["output"].stringValue))

            if let item = json["inputs"].string {
                self.inputs = [try await variables.parse(item)]
            } else {
                self.inputs = try await variables.parse(
                    json["inputs"].arrayValue.compactMap(\.string))
            }
        }
    }

    // MARK: - Properties

    public var logger: Logger?

    public init() {}

    // MARK: - Evaluate

    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let records = try await XCColorMaker().records(options.inputs)

        // 如果没有颜色，不输出文件
        guard !records.isEmpty else {
            return
        }

        // 生成颜色数组
        let colorItems = records.flatMap { record -> [ColorItem] in
            return record.names.map { name in
                let colorName = HarmonyOSVariable.parseColor(name: name, option: options)
                let colorValue = record.any.hexString(.digits6, prefix: .hashKey).uppercased()
                return ColorItem(name: colorName, value: colorValue)
            }
        }
        .sorted { $0.name < $1.name }

        // 构建 Codable 结构
        let colorResource = ColorResource(color: colorItems)

        // 生成格式化的 JSON
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let jsonData = try encoder.encode(colorResource)

        try options.output.overlay(with: jsonData)
    }

}
