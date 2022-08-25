# file_tags

```yaml
file_tags:
    # 待匹配的文件
    inputs:
        - publish-template-khala/products/flutter/2.0x
        - publish-template-khala/products/flutter/3.0x
    # 参与任务的文件标记类别
    vaild_tags:
        - flutter
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