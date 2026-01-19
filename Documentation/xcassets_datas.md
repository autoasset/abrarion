# xcassets_datas

生成 XCAssets 数据资源 (`.dataset`) 及对应的 Swift 代码。用于管理非图片类型的原始文件（如 json, txt, bin 等）。

## 配置示例

```yaml
xcassets_datas:
  inputs:
    - products/jsons
  output: Sources/Resources/Data.xcassets
  template:
    output: Sources/Generated/DataAssets.swift
    bundle_name: MyBundle
    instance_output_path: Sources/Generated/DataAssets+Instance.swift
    list_output_path: Sources/Generated/DataAssets+List.swift
```

## 字段说明

### xcassets_datas

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| inputs | 输入文件或文件夹路径 (包含待转换的数据文件) | [string] | | 是 |
| output | 输出 `.xcassets` 文件夹路径 | string | | 是 |
| template | Swift 代码生成配置 (可选) | [XCCodeOptions](./xc_code_template.md) | type="Data" | 否 |
| contents | 自定义 `Contents.json` 模板文件路径列表 | [string] | [] | 否 |
| template_dependent_output | 依赖代码输出目录 (如果使用了 template，此字段必填，用于生成 `AbrarionData` 协议定义) | string | | 否 |

## 代码生成逻辑

生成的 Swift 代码提供了 `value()` 方法，返回 `Foundation.Data`。

```swift
// 使用示例
let data = AbrarionDataAssetsListProtocol.someJsonFile.value()
```
