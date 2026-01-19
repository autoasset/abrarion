# xcassets_images

用于生成 iOS / macOS 的 XCAssets 资源目录及对应的 Swift 代码。

## 配置示例

### 基础配置

```yaml
xcassets_images:
  inputs: 
    - products/icons
  output: Sources/Resources/Icons.xcassets
  template:
    output: Sources/Generated/Icons.swift
    bundle_name: MyBundle
    instance_output_path: Sources/Generated/Icons+Instance.swift
    list_output_path: Sources/Generated/Icons+List.swift
```

### 包含矢量图模版

```yaml
xcassets_images:
  inputs: ...
  output: ...
  vector_render_as: template
  vector_template:
    output: ...
  template_dependent_output: Sources/Generated/Dependencies
```

## 字段说明

### xcassets_images

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| output | 输出 `.xcassets` 文件夹路径 | string | | 是 |
| inputs | 输入文件或文件夹路径 | string \| [string] | | 否 |
| file_tags | 按标签筛选文件 | [XCFileTags](./file_tags.md) | | 否 |
| contents | 自定义 `Contents.json` 模板文件路径 | [string] | | 否 |
| vector_render_as | 矢量图渲染模式 (`default`, `original`, `template`) | enum | template | 否 |
| template | 图片资源代码生成配置 | [XCCodeOptions](./xc_code_template.md) | type="Image" | 否 |
| vector_template | 矢量图资源代码生成配置 | [XCCodeOptions](./xc_code_template.md) | type="VectorImage" | 否 |
| template_dependent_output | 依赖代码 (Protocol/Extension) 输出目录 | string | | 当 template 或 vector_template 存在时必填 |

## 功能特性

- **自动识别**:
    - 倍率: `@1x`, `@2x`, `@3x`
    - 暗黑模式: `_dark` 后缀
    - 矢量图: PDF, SVG
- **代码生成**:
    - 支持生成 `UIImage` / `NSImage` 的硬编码引用
    - 支持生成资源枚举列表
    - 支持 Bundle 资源查找
- **Contents.json**:
    - 自动合并现有 Contents.json 配置
    - 校验缺少或冗余的资源文件
