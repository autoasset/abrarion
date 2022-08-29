# xcassets_images

- 按路径导入资源

    ```yaml
    xcassets_images:
      inputs: 
        - publish-template-khala/products/ios/icon
        - publish-template-khala/products/ios/vector_template
      output: Sources/Resources/icon.xcassets
      contents: .developer/contents/images
      template_dependent_output: ...
      template: ...
    ```

- 按标签导入资源

    ```yaml
    xcassets_images:
      file_tags: 结构参考 `file_tags`
      output: Sources/Resources/icon.xcassets
      contents: ...
      template_dependent_output: ...
      template: ...
    ```

# 字段说明

## xcassets_images

| 字段名       | 描述                     | 类型               | 默认值 | 是否必填 |
| ------------ | ------------------------ | ------------------ | ------ | -------- |
| contents | 自定义 contents.json 文件/文件夹位置 | string |  | 否 |
| output | 指定输出文件夹路径 | string |  | 是 |
| inputs | 用于扫描的资源文件路径, 可以是文件或文件夹形式, 文件夹会扫描其内文件 | string \| [string] |  | 否 |
| file_tags | file_tags 与 inputs 同时存在时, 只有 file_tags 参与任务. | [结构说明](./file_tags.md) |  | 否 |
| template | 用于生成映射资源的硬编码文件 | [结构说明](./xc_code_options.md) |  | 否 |
| template_dependent_output | 生成映射资源的硬编码文件的依赖文件放置路径 | string |  | 否 |