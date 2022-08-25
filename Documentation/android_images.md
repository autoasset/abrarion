# android_images

```yaml
android_images:
    pubspec: publish-template-flutter/pubspec.yaml
    # [必填] android resources 文件夹位置, 用于资源拷贝
    output_resources_path: publish-template-android/library/src/main/res
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
    android_images:
        output_resources_path: ...
        # file_tags 与 inputs 同时存在时, 只有 file_tags 参与任务.
        file_tags: 结构参考 `file_tags`
    ```
