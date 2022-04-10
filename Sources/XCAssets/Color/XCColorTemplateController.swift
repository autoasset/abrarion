import Stem

class XCColorTemplateController {
    
    struct Output {
        let name: String
        let code: String
    }
    
    let model: XCColorTemplate
    let colors: [XCColorSet]
    
    init(model: XCColorTemplate, colors: [XCColorSet]) {
        self.model = model
        self.colors = colors
    }
    
    func output() -> [Output] {
        return [
            .init(name: model.protocolName, code: self.protocol),
            .init(name: model.protocolName + "_extension", code: self.extensionProtocol),
            .init(name: model.instanceName, code: self.instance),
            .init(name: model.instanceName + "_" + self.model.protocolName, code: self.conform)
        ]
    }
    
    var `protocol`: String {
        return """
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif
public protocol \(model.protocolName) {
    init(light: Int64, dark: Int64)
    #if canImport(UIKit)
    func value() -> UIColor
    #elseif canImport(AppKit)
    func value() -> NSColor
    #endif
}
"""
    }
    
    var extensionProtocol: String {
"""
public extension \(model.protocolName) {
\(content)
}
"""
    }
        
    func itemWrapper(color: StemColor?) -> (hex: String, mark: String)? {
        guard let color = color else {
            return nil
        }
        let hex = color.hexString(.digits8, prefix: .bits)
        let unpack = color.rgbSpace.intUnpack
        let mark = "{ R: \(unpack.red) G: \(unpack.green) B: \(unpack.blue) }"
        return (hex, mark)
    }
    
    var content: String {
        colors
            .map({ item -> [String] in
                guard let light = itemWrapper(color: (item.colors.first(by: .light) ?? item.colors.firstNoLuminosity()).map(\.value)) else {
                    return []
                }
                
                let dark = itemWrapper(color: item.colors.first(by: .dark).map(\.value))
                return item.names.map {
                    [
                        ["    /// light: \(light.mark)",
                         dark.flatMap({ "dark: \($0.mark)"})].compactMap({ $0 }).joined(separator: " | "),
                        "    static var \($0): Self { Self.init(light: \(light.hex), dark: \(dark?.hex ?? light.hex)) }"
                    ].joined(separator: "\n")
                }
            })
            .joined()
            .joined(separator: "\n")
    }
    
    var conform: String {
        "extension \(model.instanceName): \(model.protocolName) {}"
    }
    
    var instance: String {
"""
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public struct \(model.instanceName) {
    
    #if canImport(UIKit)
    public typealias Color = UIColor
    #elseif canImport(AppKit)
    public typealias Color = NSColor
    #endif
    
    #if canImport(UIKit) || canImport(AppKit)
    public let light: Color
    public let dark: Color
    public let system: Color
    
    public init(light hex1: Int64, dark hex2: Int64) {
        let color1 = Self.color(values: Self.values(hex: hex1))
        let color2 = Self.color(values: Self.values(hex: hex2))
        self.light  = color1
        self.dark   = color2
        
        #if canImport(UIKit)
        if #available(iOS 13.0, *) {
            self.system = .init(dynamicProvider: { $0.userInterfaceStyle == .dark ? color2 : color1 })
        } else {
            self.system = color1
        }
        #elseif canImport(AppKit)
        self.system = .init(name: nil, dynamicProvider: { appearance in
            if appearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua {
                return color1
            } else {
                return color2
            }
        })
        #endif
    }
    
    public func value() -> Color { return system }
    
    private static func color(values: [CGFloat]) -> Color {
        return Color(red: values[0], green: values[1], blue: values[2], alpha: values[3])
    }
    
    /// 十六进制色: 0x666666
    ///
    /// - Parameter RGBValue: 十六进制颜色
    private static func values(hex value: Int64) -> [CGFloat] {
        var hex = value
        var count = 0
        
        while count <= 8, hex > 0 {
            hex = hex >> 4
            count += 1
            if count > 8 { break }
        }
        
        let divisor = Double(255)
        
        if count <= 6 {
            let red     = Double((value & 0xFF0000) >> 16) / divisor
            let green   = Double((value & 0x00FF00) >>  8) / divisor
            let blue    = Double( value & 0x0000FF       ) / divisor
            return [red, green, blue, 1]
        } else if count <= 8 {
            let red     = Double((Int64(value) & 0xFF000000) >> 24) / divisor
            let green   = Double((Int64(value) & 0x00FF0000) >> 16) / divisor
            let blue    = Double((Int64(value) & 0x0000FF00) >>  8) / divisor
            let alpha   = Double( Int64(value) & 0x000000FF       ) / divisor
            return [red, green, blue, alpha]
        } else {
            return [0,0,0,1]
        }
    }
#endif
    
}

"""
    }
    
}
