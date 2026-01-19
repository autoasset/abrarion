# xcassets_iconfonts

解析 Khala 格式的 IconFont JSON 数据与字体文件，生成 XCAssets 资源及 Swift 代码。

该任务将字体文件注册到 XCAssets 中作为 Data 资源，并生成代码以便在运行时动态注册字体和使用 Icon。

## 配置示例

```yaml
xcassets_iconfonts:
  input_json: products/iconfont.json
  input_font: products/iconfont.ttf
  output: Sources/Resources/IconFont.xcassets
  template:
    output: Sources/Generated/IconFont.swift
    bundle_name: MyBundle
    instance_output_path: Sources/Generated/IconFont+Instance.swift
    list_output_path: Sources/Generated/IconFont+List.swift
```

## 字段说明

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| input_json | IconFont 数据的 JSON 文件路径 | string | | 是 |
| input_font | 字体文件路径 (.ttf) | string | | 是 |
| output | 输出 `.xcassets` 文件夹路径 | string | | 是 |
| template | Swift 代码生成配置 | [XCCodeOptions](./xc_code_template.md) | type="Data" | 否 |

## 代码生成特性

生成的代码包含：
1. **自动注册**: 提供 `register(data:)` 方法，支持动态注册字体。
2. **UI 适配**: 提供 `font(ofSize:)` 方法，返回 `UIFont` / `NSFont`。
3. **AttributedString**: 提供便捷方法生成带属性的字符串。
4. **Bundle 资源**: 字体文件作为 Data Asset 存储在 Bundle 中。

```swift
// 使用示例
let icon = AbrarionIconFontListProtocol.home
let font = icon.font(ofSize: 24)
let string = icon.string // 获取 unicode 字符
```
