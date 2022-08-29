# flutter_images

- 按路径导入资源

    ```yaml
    flutter_images:
        pubspec: publish-template-flutter/pubspec.yaml
        output_resources_path: publish-template-flutter/resources
        template:
            variable_name_type: camel
            package_name: abrarion
            class_name: AbrarionImages
            output: publish-template-flutter/lib/abrarion_images.dart
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
        file_tags: 结构参考 `file_tags`
    ```

# 字段说明

## flutter_images

| 字段名       | 描述                     | 类型               | 默认值 | 是否必填 |
| ------------ | ------------------------ | ------------------ | ------ | -------- |
| output_resources_path | flutter resources 文件夹位置, 用于资源拷贝 resources/images/2.0x, resources/images/3.0x...等 | string | null | 是 |
| pubspec | flutter pubspec 所在位置, 用于锚定生成资源文件相对路径 (不做 pubspec 内容更改) | string | null | 是 |
| inputs | 用于扫描的资源文件路径, 可以是文件或文件夹形式, 文件夹会扫描其内文件 | [string] | null | 否 |
| file_tags | file_tags 与 inputs 同时存在时, 只有 file_tags 参与任务. | [结构说明](./Documentation/file_tags.md) | null | 否 |
| template | 用于生成映射资源的硬编码 dart 文件 | [结构说明](#flutterimagestemplate) | null | 否 |

## flutter_images.template

| 字段名       | 描述                     | 类型               | 默认值 | 是否必填 |
| ------------ | ------------------------ | ------------------ | ------ | -------- |
| variable_name_type | camel: 驼峰 <br />snake: 下划线<br /> none: 文件名 | enum | camel | 否|

# 注意事项

- 参与任务的文件数据类型: png, jpeg, gif
- 参与任务的文件命名要求:
    
    - png, jpeg, gif 需要带上倍率标识
    
        > 例如: xx@2x.jpg