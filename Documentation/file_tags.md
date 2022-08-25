# file_tags

结构:

```yaml
file_tags:
    # 待匹配的文件
    inputs:
        - publish-template-khala/products/flutter/2.0x
        - publish-template-khala/products/flutter/3.0x
    # 参与任务的文件标记类别
    vaild_tags:
        - flutter
    # 不参与任务的文件标记类别
    exclude_tags:
        - error_files
    expressions:
        - name: flutter所使用的资源
          # 匹配模式
          # and: 通过全部 pattern 才会被标记 tags
          #  or: 通过任一 pattern 就会被标记 tags
          kind: and
          # 标记
          # 通过该规则的文件, 会被添加标记, 在相应任务内可以使用标记来区分文件.
          tags:
            - error_files
          # 当 patterns 与 files 合并后, 规则条数仍为 0, 则通过该变量判断文件是否匹配
          # always_fail: [默认] 全部失败
          # always_pass: 全部匹配
          substitute: always_fail
          # 匹配规则, 若规则能匹配完整文件名, 则视为该规则通过
          patterns:
            - add_address(?:@\dx)?.png
        
        - name: flutter所使用的资源
          # 匹配模式
          # and: 通过全部 pattern 才会被标记 tags
          #  or: 通过任一 pattern 就会被标记 tags
          kind: or
          # 标记
          # 通过该规则的文件, 会被添加标记, 在相应任务内可以使用标记来区分文件.
          tags:
            - flutter
          # 匹配规则, 若规则能匹配完整文件名, 则视为该规则通过
          patterns:
            - add_address(?:@\dx)?.png
          # 文件型匹配规则, 若规则能匹配完整文件名, 则视为该规则通过
          # 路径只能是已存在的文件
          # 文件内按行划分规则
          files:
            - ./flutter_tags.txt
```

- 真正参与任务的文件: 

    > vaild_tags 匹配到的文件, 移除 exclude_tags 匹配到的文件.
    
    具体实现:

    ```swift
    func vaild_files() -> Set<STFile> {
        var vailds = Set<STFile>()
        model.vaild_tags.forEach { tag in
            if let files = store[tag] {
                vailds.formUnion(files)
            }
        }
        var exclude = Set<STFile>()
        model.exclude_tags.forEach { tag in
            if let files = store[tag] {
                exclude.formUnion(files)
            }
        }
        return vailds.subtracting(exclude)
    }
    ```
