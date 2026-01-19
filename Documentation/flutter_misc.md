# flutter_pubspec

自动化更新 Flutter 项目的 `pubspec.yaml` 文件，自动注册字体和图片资源。

## 配置示例

```yaml
flutter_pubspec:
  input: flutter_app/pubspec.yaml
  fonts: flutter_app/assets/fonts
  images: flutter_app/assets/images
```

## 字段说明

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| input | 目标 `pubspec.yaml` 文件路径 | string | | 是 |
| fonts | 字体资源文件夹路径 | string | | 是 |
| images | 图片资源文件夹路径 | string | | 是 |

## 工作原理

1. **字体注册**: 扫描 `fonts` 目录下的字体文件，自动提取 Font Family 名称（取文件名的公共前缀），并注册到 `flutter.fonts` 节点。
2. **资源注册**: 扫描 `images` 目录下的所有文件，将相对路径添加到 `flutter.assets` 节点。

> **注意**: 该任务会重写 `pubspec.yaml`，请确保文件格式标准。

---

# flutter_iconfont

解析 Khala 格式的 IconFont JSON 数据，生成 Flutter IconData 代码。

## 配置示例

```yaml
flutter_iconfont:
  input: products/iconfont.json
  output: lib/generated/icons.dart
  template:
    class_name: AppIcons
    package_name: my_package
```

## 字段说明

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| input | IconFont 数据的 JSON 文件路径 | string | | 是 |
| output | 输出 Dart 文件路径 | string | | 是 |
| template | Dart 代码生成配置 | [FlutterCodeOptions](./flutter_images.md#fluttercodeoptions) | | 是 |

## 输入数据格式 (iconfont.json)

```json
{
  "font_family": "iconfont",
  "glyphs": [
    {
      "name": "home",
      "unicode": "e601"
    }
  ]
}
```
