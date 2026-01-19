// MIT License
//
// Copyright (c) 2020 linhey
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

public class NameFormatter {

    /// 系统保留字
    /// https://docs.swift.org/swift-book/ReferenceManual/LexicalStructure.html#:~:text=the%20following%20keywords%20are%20reserved%20and%20can%E2%80%99t%20be%20used%20as%20identifiers
    struct SwiftReservedWords {
        static let declarations = [
            "associatedtype", "class", "deinit", "enum", "extension", "fileprivate", "func",
            "import", "init", "inout", "internal", "let", "open", "operator", "private",
            "precedencegroup", "protocol", "public", "rethrows", "static", "struct", "subscript",
            "typealias", "var",
        ]
        static let statements = [
            "break", "case", "catch", "continue", "default", "defer", "do", "else", "fallthrough",
            "for", "guard", "if", "in", "repeat", "return", "throw", "switch", "where", "while",
        ]
        static let expressionsAndTypes = [
            "Any", "as", "catch", "false", "is", "nil", "rethrows", "self", "Self", "super",
            "throw", "throws", "true", "try",
        ]
        static let patterns = ["_"]
        static let beginWithNumberSign = [
            "#available", "#colorLiteral", "#column", "#dsohandle", "#elseif", "#else", "#endif",
            "#error", "#fileID", "#fileLiteral", "#filePath", "#file", "#function", "#if",
            "#imageLiteral", "#keyPath", "#line", "#selector", "#sourceLocation", "#warning",
        ]
        static let particularContexts = [
            "associativity", "convenience", "didSet", "dynamic", "final", "get", "indirect",
            "infix", "lazy", "left", "mutating", "none", "nonmutating", "optional", "override",
            "postfix", "precedence", "prefix", "Protocol", "required", "right", "set", "some",
            "Type", "unowned", "weak", "willSet",
        ]

        static let all: Set<String> = .init(
            declarations + statements + expressionsAndTypes + patterns + beginWithNumberSign
                + particularContexts)
    }

    public enum Language {
        case swift
    }

    private let language: Language
    /// 分割字符
    private let splitCharSet: CharacterSet

    public init(language: Language, splitSet: CharacterSet) {
        self.splitCharSet = splitSet
        self.language = language
    }

}

extension NameFormatter {

    /// 驼峰
    public func camelCased(_ str: String) -> String {
        let name = splitWords(str)
            .enumerated()
            .map { $0.offset > 0 ? $0.element.capitalized : $0.element.lowercased() }
            .joined()
        return reservedWords(name)
    }

    /// 下划线
    public func snakeCased(_ str: String) -> String {
        let name = splitWords(str).joined(separator: "_")
        return reservedWords(name)
    }

    private func reservedWords(_ name: String) -> String {
        switch language {
        case .swift:
            if SwiftReservedWords.all.contains(name) {
                return "`\(name)`"
            }
        }
        return name
    }

}

extension NameFormatter {

    public func splitWords(_ str: String) -> [String] {
        var words = [String]()
        var buffer = [String]()
        var bufferIsNumber = false

        for item in str {
            let char = String(item)

            if CharacterSet(charactersIn: char).isSubset(of: splitCharSet) {
                words.append(buffer.joined())
                buffer.removeAll()
                continue
            }

            /// 切割非法字符
            guard item.isNumber || ("a"..."z").contains(item.lowercased()) else {
                words.append(buffer.joined())
                buffer.removeAll()
                continue
            }

            guard !item.isUppercase else {
                words.append(buffer.joined())
                buffer.removeAll()
                buffer.append(char)
                bufferIsNumber = false
                continue
            }

            /// 切割数字/字母
            if buffer.isEmpty {
                bufferIsNumber = item.isNumber
            }

            if item.isNumber == bufferIsNumber {
                buffer.append(char)
            } else {
                words.append(buffer.joined())
                buffer.removeAll()
                buffer.append(char)
                bufferIsNumber = item.isNumber
            }
        }

        words.append(buffer.joined())
        return words.filter({ $0.isEmpty == false }).map({ $0.lowercased() })
    }

}
