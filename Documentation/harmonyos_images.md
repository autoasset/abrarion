# harmonyos_images

用于处理 HarmonyOS 图片资源，支持多分辨率 (`mdpi` ~ `xxxldpi`)、矢量图 (`base`) 以及暗黑模式资源。

## 配置示例

```yaml
harmonyos_images:
  output_resources_path: entry/src/main/resources
  inputs:
    - assets/images
  dark_mode_enabled: true
```

### 高级配置 (特殊分辨率)

```yaml
harmonyos_images:
  output_resources_path: ...
  inputs: ...
  substitute_inputs:
    - density: ldpi
      tags: ["low_res"]
    - density: xldpi
      tags: ["dark_icons"]
      dark: true  # 强制指定为暗黑资源
```

## 字段说明

### harmonyos_images

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| output_resources_path | HarmonyOS `resources` 文件夹路径 (会自动生成 base/media, zh_CN/media 等目录) | string | | 是 |
| inputs | 输入文件或文件夹路径 | string \| [string] | | 否 |
| file_tags | 按标签筛选文件 | [XCFileTags](./file_tags.md) | | 否 |
| substitute_inputs | 备选输入源 (不覆盖同名现有文件) | [CustomInput](#custominput)[] | | 否 |
| custom_inputs | 自定义输入源 (强制覆盖同名文件) | [CustomInput](#custominput)[] | | 否 |
| dark_mode_enabled | 是否自动识别暗黑模式文件名 (如 `_dark`) | bool | true | 否 |

### CustomInput

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| density | 分辨率类型 | enum | | 是 |
| tags | 筛选文件的标签列表 | [string] | | 是 |
| dark | 强制指定是否为暗黑模式资源 | bool | false | 否 |

**支持的 Density**:
- `base`: `base/media` (矢量图, 通用资源)
- `ldpi`: `base/media` (通常作为默认)
- `mdpi`: `base/media` (1x)
- `sdpi`: `base/media`
- `hdpi`: `base/media` (1.5x)
- `xldpi`: `base/media` (2x - 对应 iOS @2x)
- `xxldpi`: `base/media` (3x - 对应 iOS @3x)
- `xxxldpi`: `base/media` (4x)

## 资源映射规则

| 原始倍率 | HarmonyOS Density | 目录结构 |
| :--- | :--- | :--- |
| `@1x` | `mdpi` | `resources/base/media` |
| `@2x` | `xldpi` | `resources/base/media` (注: 实际会根据配置可能放入限定符目录) |
| `@3x` | `xxldpi` | `resources/base/media` |
| `@4x` | `xxxldpi` | `resources/base/media` |
| Vector (PDF/SVG) | `base` | `resources/base/media` |

> **注意**: HarmonyOS 的资源目录结构较为灵活，abrarion 默认会将不同分辨率的图片放入对应的目录中。暗黑模式资源会放入 `dark/media` 目录下 (如果配置支持)。
