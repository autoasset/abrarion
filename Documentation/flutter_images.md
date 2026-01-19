# flutter_images

用于处理 Flutter 图片资源，自动生成 Dart 引用代码。

## 配置示例

### 按路径导入资源

```yaml
flutter_images:
  pubspec: publish-template-flutter/pubspec.yaml
  output_resources_path: publish-template-flutter/resources
  template:
    output: publish-template-flutter/lib/abrarion_images.dart
    class_name: AppImages
    package_name: my_package
  inputs:
    - publish-template-khala/products/flutter/2.0x
    - publish-template-khala/products/flutter/3.0x      
```

### 按标签导入资源

> [file_tags 结构参考](./file_tags.md)

```yaml
flutter_images:
  pubspec: publish-template-flutter/pubspec.yaml
  output_resources_path: publish-template-flutter/resources
  template: ...
  file_tags: ...
```

## 字段说明

### flutter_images

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| output_resources_path | flutter resources 文件夹位置, 用于资源拷贝 (会自动创建 images/2.0x, images/3.0x 等子目录) | string | | 是 |
| pubspec | flutter pubspec.yaml 文件路径, 用于计算相对路径 | string | | 是 |
| template | 用于生成 Dart 引用代码的配置 | [FlutterCodeOptions](#fluttercodeoptions) | | 是 |
| inputs | 用于扫描的资源文件路径或文件夹 | string \| [string] | | 否 (inputs 与 file_tags 二选一) |
| file_tags | 按标签筛选文件 | [XCFileTags](./file_tags.md) | | 否 (inputs 与 file_tags 二选一) |

### FlutterCodeOptions

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| output | 生成的 Dart 文件路径 | string | | 否 |
| class_name | 生成的类名 | string | | 是 |
| package_name | 包名 (用于 Image.asset 的 package 参数) | string | | 是 |
| variable_name_type | 变量命名风格: `camel` (驼峰), `snake` (下划线), `none` (原文件名) | enum | camel | 否 |
| color_prefix_when_name_is_hex | 当颜色名为 Hex 时的前缀 (仅用于颜色生成) | string | c_ | 否 |

## 注意事项

- **支持格式**: png, jpeg, gif
- **命名规范**:
    - 文件名应包含倍率标识 (如 `icon@2x.png`, `bg@3x.jpg`)
    - 自动识别并归类到对应的倍率目录 (2.0x, 3.0x)
