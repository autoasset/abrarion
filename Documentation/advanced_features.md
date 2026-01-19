# advanced_features

这里介绍了 `abrarion` 的一些高级或特定场景的功能，包括数据资源生成、Flutter 配置自动注入以及 IconFont 支持。

## xcassets_datas (Data 资源)

将任意文件（如 JSON, XML, 二进制文件）打包进 `.xcassets` 并生成对应的 Swift 访问代码。

```yaml
xcassets_datas:
  inputs:
    - assets/config.json
    - assets/certs/
  output: Sources/Resources/Data.xcassets
  template:
    output: Sources/Generated/DataAssets.swift
    bundle_name: MyBundle
```

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| inputs | 输入文件或文件夹 | [string] | | 是 |
| output | 输出 `.xcassets` 路径 | string | | 是 |
| template | Swift 代码生成配置 | [XCCodeOptions](./xc_code_template.md) | type="Data" | 否 |

## flutter_pubspec (Flutter 自动配置)

自动扫描 Flutter 项目的 `assets` 和 `fonts` 目录，并注入到 `pubspec.yaml` 中，避免手动维护。

```yaml
flutter_pubspec:
  input: flutter_app/pubspec.yaml
  images: flutter_app/assets/images
  fonts: flutter_app/assets/fonts
```

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| input | `pubspec.yaml` 文件路径 | string | | 是 |
| images | 图片资源目录路径 (自动添加到 `flutter: assets` 节点) | string | | 是 |
| fonts | 字体资源目录路径 (自动添加到 `flutter: fonts` 节点) | string | | 是 |

> **注意**: 该功能会重写 `pubspec.yaml` 文件，请确保文件已备份或在版本控制下。它会自动按文件名生成字体配置，并将所有图片路径添加到 assets 列表。

## xcassets_iconfonts & flutter_iconfont

(实验性功能) 支持从 IconFont 字体文件生成对应的资源代码。

> 文档待完善
