//
//  File.swift
//  
//
//  Created by linhey on 2023/8/22.
//

import Foundation
import ArgumentParser
import StemFilePath
import SwiftSoup

struct VectorDrawableToSVG: AsyncParsableCommand {
    
    static var configuration: CommandConfiguration = .init(commandName: "vd2svg", abstract: "Android vector drawable to SVG converter")

    /// 用于处理 https://github.com/neworld/vd2svg 后缺少 viewBox 字段
    func run() async throws {
        let output = try STFolder("./output-svg").create()
        for file in try STFolder("./").allSubFilePaths().compactMap(\.asFile) {
            let doc  = try SwiftSoup.parse(file.read())
            var dict = [String: String]()
            if var svg = try doc.select("svg").first(),
               let attributes = svg.getAttributes()?.asList() {
                attributes.forEach { attribute in
                    dict[attribute.getKey()] = attribute.getValue()
                }
                if dict["viewBox"] == nil,
                   let width = dict["width"],
                   let height = dict["height"] {
                    try svg.removeAttr("xmlns:android")
                    svg = try svg.attr("viewBox", "0 0 \(width) \(height)")
                    try output.create(file: file.attributes.name, data: svg.description.data(using: .utf8))
                    print(file.attributes.name)
                }
                
            }
        }
    }
    
}
