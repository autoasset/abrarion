# abrarion

abrarion 是一个基于 Swift 开发的跨平台资源管理与任务编排工具。它能够通过配置文件（YAML/JSON）自动化处理 iOS、Android、Flutter、HarmonyOS 等多平台的资源导入、转换与硬编码生成任务。

## 特性

- **多平台支持**：支持 iOS (XCAssets)、Android、Flutter、HarmonyOS 等平台的资源管理。
- **任务编排**：基于 Mission 架构，通过 YAML/JSON 灵活配置任务流。
- **自动化生成**：支持生成对应的硬编码文件（如 Swift, Dart, Kotlin 代码），减少手动引用错误。
- **环境隔离**：支持外部环境变量配置，适应不同构建环境。

## 安装

使用 Homebrew 安装：

```shell
brew tap autoasset/abrarion
brew install autoasset/abrarion/abrarion
```

## 更新

```shell
brew upgrade autoasset/abrarion/abrarion
```

## 使用方法

通过命令行运行任务：

```shell
abrarion --config missions.yaml
```

或者指定环境变量文件：

```shell
abrarion --config missions.yaml --environment environment.yaml
```

### 参数说明

- `--config`: 任务流配置文件路径（YAML/JSON）。
- `--environment`: (可选) 外部环境变量配置文件路径。

## 配置文件 (missions.yaml)

abrarion 通过配置文件定义具体的任务。以下是常用任务模块的文档：

### 资源管理
- **iOS / macOS**:
    - [xcassets_images](./Documentation/xcassets_images.md) (图片)
    - [xcassets_datas](./Documentation/xcassets_datas.md) (数据)
    - [xcassets_iconfonts](./Documentation/xcassets_iconfonts.md) (IconFont 字体)
- **Flutter**:
    - [flutter_images](./Documentation/flutter_images.md) (图片)
    - [flutter_misc](./Documentation/flutter_misc.md) (IconFont & Pubspec 管理)
- **Android**:
    - [android_images](./Documentation/android_images.md)
- **HarmonyOS**:
    - [harmonyos_images](./Documentation/harmonyos_images.md)
- **多平台颜色**:
    - [platform_colors](./Documentation/platform_colors.md) (iOS, Android, Flutter, HarmonyOS)

### 工具与操作
- **文件操作**: [tidy_operations](./Documentation/tidy_operations.md) (复制、删除、创建、统计大小)
- **实用工具**: [utilities](./Documentation/utilities.md) (Shell 执行、CocoaPods 发布、变量调试)
- **文件筛选**: [file_tags](./Documentation/file_tags.md) (灵活的文件筛选与分组策略)

### 配置示例

```yaml
# missions.yaml 示例

# iOS 图片资源任务
xcassets_images:
  inputs:
    - products/icons
  output: Sources/Resources/Images.xcassets
  template:
    output: Sources/Generated/Images.swift

# Flutter 图片资源任务
flutter_images:
  pubspec: flutter_app/pubspec.yaml
  output_resources_path: flutter_app/assets/images
  inputs:
    - products/flutter_images
  template:
    output: flutter_app/lib/generated/assets.dart
    class_name: AppAssets
```

## 开发与构建

如果您需要从源码编译：

```shell
./scripts/build.sh
```

---

[更多文档](./Documentation/)
