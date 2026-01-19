# android_images

用于处理 Android 图片资源 (Drawable/Mipmap)。

## 配置示例

### 按路径导入资源

```yaml
android_images:
  output_resources_path: app/src/main/res
  inputs:
    - assets/images
```

### 按标签导入资源

> [file_tags 结构参考](./file_tags.md)

```yaml
android_images:
  output_resources_path: app/src/main/res
  file_tags: ...
```

### 包含特殊分辨率处理

```yaml
android_images:
  output_resources_path: app/src/main/res
  inputs: ...
  substitute_inputs:
    - density: drawable-ldpi
      tags: ["low_res_icon"]
```

## 字段说明

### android_images

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| output_resources_path | Android `res` 文件夹路径 | string | | 是 |
| inputs | 用于扫描的资源文件路径或文件夹 | string \| [string] | | 否 |
| file_tags | 按标签筛选文件 | [XCFileTags](./file_tags.md) | | 否 |
| substitute_inputs | 备选输入源 (通常用于特定 density 的补充) | [CustomInput](#custominput)[] | | 否 |
| custom_inputs | 自定义输入源 (功能同 substitute_inputs) | [CustomInput](#custominput)[] | | 否 |

### CustomInput

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| density | Android 资源目录类型 (如 `drawable`, `drawable-hdpi` 等) | enum | | 是 |
| tags | 筛选文件的标签列表 | [string] | | 是 |

**支持的 Density 类型**:
- `drawable`
- `drawable-ldpi`
- `drawable-mdpi`
- `drawable-hdpi`
- `drawable-xhdpi`
- `drawable-xxhdpi`
- `drawable-xxxhdpi`
- `drawable-night` ... (以及其他标准 Android density 限定符)

## 注意事项

- **支持格式**: png, jpeg, gif, xml
- **倍率映射**:
    - `@1x` -> `drawable-mdpi`
    - `@2x` -> `drawable-xhdpi`
    - `@3x` -> `drawable-xxhdpi`
    - `@4x` -> `drawable-xxxhdpi`
    - 矢量图 (vector) -> `drawable`
- **命名规范**:
    - `.9.png` 文件会自动处理后缀，保持 `.9.png` 格式或去除 `.9` 部分作为文件名 (视具体逻辑而定，通常保持文件名一致性)
