# XCCodeOptions

`XCCodeOptions` 用于配置 XCAssets 资源对应的 Swift 代码生成规则。

## 字段说明

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| bundle_name | 资源所在的 Bundle 名称 (用于 `Bundle(path:)` 或 `Bundle.module`) | string | | 是 |
| instance_output_path | 生成的实例代码文件路径 (定义具体的资源结构体) | string | | 是 |
| list_output_path | 生成的列表扩展代码文件路径 (定义 Protocol 扩展属性) | string | | 是 |
| list_protocol_name | 列表协议名称 (用于 `extension Protocol { ... }`) | string | `AbrarionImageListProtocol` / `AbrarionVectorImageListProtocol` | 否 |
| instance_name | 实例结构体名称 | string | `AbrarionImageInstance` / `AbrarionVectorImageInstance` | 否 |
| instance_protocol_name | 实例协议名称 | string | `AbrarionImage` / `AbrarionVectorImage` | 否 |
| color_prefix_when_name_is_hex | 当资源名为 Hex 色值时添加的前缀 (仅用于颜色生成，图片一般不用) | string | `_` | 否 |

## 代码生成逻辑

Abrarion 会生成两部分代码：
1. **Instance Definition**: 定义资源加载的逻辑 (UIKit / AppKit 兼容)。
2. **List Extension**: 将每个扫描到的资源作为静态属性添加到 List Protocol 中。

### 生成代码示例

**Instance File**:
```swift
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public protocol AbrarionImage {
    var named: String { get }
    var bundle: String? { get }
    init(named: String, in bundle: String?)
}

public extension AbrarionImage {
    // ... value() implementation for UIImage/NSImage ...
}

public struct AbrarionImageInstance: AbrarionImage, AbrarionImageListProtocol {
    public let named: String
    public let bundle: String?
    // ...
}
```

**List File**:
```swift
public extension AbrarionImageListProtocol {
    /* icon_home bundle: MyBundle */
    static var iconHome: AbrarionImageInstance { .init(named: "icon_home", in: "MyBundle") }
    
    /* icon_user bundle: MyBundle */
    static var iconUser: AbrarionImageInstance { .init(named: "icon_user", in: "MyBundle") }
}
```
