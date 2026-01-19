# platform_colors

Abrarion 支持多平台的颜色资源生成，能够从统一的 JSON 配置文件生成 iOS, Android, Flutter, HarmonyOS 的颜色代码或资源文件。

## 通用输入格式

所有颜色任务都支持通过 `inputs` 字段指定颜色配置文件（JSON 格式）。

**颜色配置示例 (colors.json):**

```json
[
  {
    "names": ["primary", "brand"],
    "any": "#007AFF",
    "light": "#007AFF",
    "dark": "#0A84FF",
    "space": "srgb"
  },
  {
    "names": ["background"],
    "any": "#FFFFFF",
    "dark": "#000000"
  }
]
```

## xcassets_colors (iOS/macOS)

生成 `.xcassets` 颜色集以及对应的 Swift 代码。

```yaml
xcassets_colors:
  inputs:
    - colors.json
  output: Sources/Resources/Colors.xcassets
  template:
    instance_output_path: Sources/Generated/Colors+Instance.swift
    list_output_path: Sources/Generated/Colors+List.swift
    bundle_name: MyBundle
```

### 字段说明

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| inputs | 颜色 JSON 文件路径列表 | [string] | | 是 |
| output | 输出 `.xcassets` 文件夹路径 | string | | 是 |
| template | Swift 代码生成配置 (可选) | [XCCodeOptions](./xc_code_template.md) | type="Color" | 否 |

## android_colors (Android)

生成 Android `colors.xml` 资源文件。

```yaml
android_colors:
  inputs:
    - colors.json
  output_light: app/src/main/res/values/colors.xml
  output_dark: app/src/main/res/values-night/colors.xml
  color_prefix_when_name_is_hex: "c_"
```

### 字段说明

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| inputs | 颜色 JSON 文件路径列表 | [string] | | 是 |
| output_light | 浅色/默认模式输出路径 | string | | 是 |
| output_dark | 深色模式输出路径 | string | | 是 |
| color_prefix_when_name_is_hex | 当颜色名为 Hex 时添加的前缀 | string | c_ | 否 |

## flutter_colors (Flutter)

生成 Flutter `Color` 常量类。

```yaml
flutter_colors:
  inputs:
    - colors.json
  output_light: lib/generated/colors.dart
  template_light:
    class_name: AppColors
    package_name: my_app
  
  # 可选: 生成独立的暗黑模式颜色类
  output_dark: lib/generated/colors_dark.dart
  template_dark:
    class_name: AppColorsDark
    package_name: my_app
```

### 字段说明

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| inputs | 颜色 JSON 文件路径列表 | [string] | | 是 |
| output_light | 默认颜色 Dart 文件路径 | string | | 是 |
| template_light | 默认颜色代码配置 | [FlutterCodeOptions](./flutter_images.md#fluttercodeoptions) | | 是 |
| output_dark | 暗色颜色 Dart 文件路径 | string | | 否 |
| template_dark | 暗色颜色代码配置 | [FlutterCodeOptions](./flutter_images.md#fluttercodeoptions) | | 当 output_dark 存在时必填 |

## harmonyos_colors (HarmonyOS)

生成 HarmonyOS `color.json` 资源文件。

```yaml
harmonyos_colors:
  inputs:
    - colors.json
  output: entry/src/main/resources/base/element/color.json
  color_prefix_when_name_is_hex: "c_"
```

### 字段说明

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| inputs | 颜色 JSON 文件路径列表 | [string] | | 是 |
| output | 输出 `.json` 文件路径 | string | | 是 |
| color_prefix_when_name_is_hex | 当颜色名为 Hex 时添加的前缀 | string | c_ | 否 |
