# abrarion

# 安装

```shell
brew tap autoasset/abrarion
brew install autoasset/abrarion/abrarion
```

# 更新

```shell
brew upgrade autoasset/abrarion/abrarion
```

# version >= 0.0.29

## flutter_images

> 处理 flutter 相关资源

- 参数结构:

    - file_tags

    ```yaml
    file_tags:
        # 待匹配的文件
        inputs:
            - publish-template-khala/products/flutter/2.0x
            - publish-template-khala/products/flutter/3.0x
        # 参与任务的文件标记类别
        vaild_tags:
            -  flutter
        expressions:
            - name: flutter所使用的资源
              # 匹配模式
              # and: 通过全部 pattern 才会被标记 tags
              #  or: 通过任一 pattern 就会被标记 tags
              kind: or | and
              # 标记
              # 通过该规则的文件, 会被添加标记, 在相应任务内可以使用标记来区分文件.
              tags:
                - error_files
              # 匹配规则, 若规则能匹配完整文件名, 则视为该规则通过
              patterns:
                - add_address(?:@\dx)?.png
              # 文件型匹配规则, 若规则能匹配完整文件名, 则视为该规则通过
              # 路径只能是已存在的文件
              # 文件内按行划分规则
              files:
                - ./flutter_tags.txt
  ```

    - flutter_images

    ```yaml
    flutter_images:
      # [必填] flutter pubspec 所在位置, 用于锚定生成资源文件相对路径. (不做 pubspec 内容更改)
      pubspec: publish-template-flutter/pubspec.yaml
      # [必填] flutter resources 文件夹位置, 用于资源拷贝至 resources/images/2.0x, resources/images/3.0x...等
      output_resources_path: publish-template-flutter/resources
      # [选填] 用于生成映射资源的硬编码 dart 文件
      template:
        # 变量类型 驼峰: camel | 下划线: snake | 文件名: none
        variable_name_type: camel
        package_name: abrarion
        class_name: AbrarionImages
        output: publish-template-flutter/lib/abrarion_images.dart
      # [选填] 用于扫描的资源文件路径, 可以是文件或文件夹形式, 文件夹会递归扫描文件.
      # 资源文件需要在文件名中标识倍率, 例如 xx@2x.jpg
      # 用于扫描的文件夹中不要放入非资源文件, 没做文件格式判断.
      inputs:
        - publish-template-khala/products/flutter/2.0x
        - publish-template-khala/products/flutter/3.0x
    ```

    - 按标签导入资源

    ```yaml
    flutter_images:
        pubspec: ...
        output_resources_path: ...
        template: ...
        # file_tags 与 inputs 同时存在时, 只有 file_tags 参与任务.
        file_tags: 结构参考 `file_tags`
    ```