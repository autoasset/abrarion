# flutter_images

```yaml
flutter_images:
    # [必填] flutter pubspec 所在位置, 用于锚定生成资源文件相对路径 (不做 pubspec 内容更改)
    pubspec: publish-template-flutter/pubspec.yaml
    # [必填] flutter resources 文件夹位置, 用于资源拷贝 resources/images/2.0x, resources/images/3.0x...等
    output_resources_path: publish-template-flutter/resources
    # [选填] 用于生成映射资源的硬编码 dart 文件
    template:
      # 变量类型 驼峰: camel | 下划线: snake | 文件名: none
      variable_name_type: camel
      package_name: abrarion
      class_name: AbrarionImages
      output: publish-template-flutter/lib/abrarion_images.dart
    # [选填] 用于扫描的资源文件路径, 可以是文件或文件夹形式, 文件夹会   扫描文件.
    # 资源文件需要在文件名中标识倍率, 例如 xx@2x.jpg, 不标识则不参  务.
    # 文件夹中 [png | jpeg | gif] 格式文件会参与任务, 其他格式不    任务.
    inputs:
      - publish-template-khala/products/flutter/2.0x
      - publish-template-khala/products/flutter/3.0x      
```

- 按标签导入资源
    
    > [file_tags 结构参考](./Documentation/file_tags.md)

    ```yaml
    flutter_images:
        pubspec: ...
        output_resources_path: ...
        template: ...
        # file_tags 与 inputs 同时存在时, 只有 file_tags 参与任务.
        file_tags: 结构参考 `file_tags`
    ```