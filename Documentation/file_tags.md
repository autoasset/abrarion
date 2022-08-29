# file_tags

> 文件标记

- 输入所有文件标置为指定标记

  ``` yaml
  file_tags:
    vaild_tags: 
      - flutter
    expressions:
      - inputs:
          - publish-template-khala/products/flutter/2.0x
          - publish-template-khala/products/flutter/3.0x
        name: flutter
        tags: flutter
        substitute: always_pass
  ```

- 只匹配符合规则文件规则的文件

  ``` yaml
  # ./flutter_tags.txt 内容:
  # add_address(?:@\dx)?.png
  # add_address2(?:@\dx)?.png

  file_tags:
    vaild_tags: 
      - flutter
    expressions:
      - inputs:
          - ...
          - ...
        name: flutter
        tags: flutter
        substitute: always_fail
        files:
            - ./flutter_tags.txt
  ```

- 只匹配指定规则的文件

  ``` yaml
  file_tags:
    vaild_tags: 
      - flutter
    expressions:
      - inputs:
          - ...
          - ...
        name: flutter
        tags: flutter
        substitute: always_fail
        patterns:
          - add_address(?:@\dx)?.png
  ```

- 匹配指定多个标记类型

  ``` yaml
  file_tags:
    vaild_tags: 
      - tag_a
      - tag_b
      - ...
    expressions:
      - inputs:
          - ...
          - ...
        name: tag_a
        tags: tag_a
        substitute: always_fail
        patterns:
          - ...
      - inputs:
          - ...
          - ...
        name: tag_b
        tags: tag_b
        substitute: always_fail
        patterns:
          - ...
      - ...
  ```

- 匹配指定多个标记类型差集

  ``` yaml
  file_tags:
    vaild_tags: 
      - tag_a
      - ...
    exclude_tags:
      - tag_b
      - ...
    expressions:
      - inputs:
          - ...
          - ...
        name: tag_a
        tags: tag_a
        substitute: always_fail
        patterns:
          - ...
      - inputs:
          - ...
          - ...
        name: tag_b
        tags: tag_b
        substitute: always_fail
        patterns:
          - ...
      - ...
  ```

# 字段说明

| 字段名       | 描述                     | 类型               | 默认值 | 是否必填 |
| ------------ | ------------------------ | ------------------ | ------ | -------- |
| vaild_tags   | 参与任务的文件标记类别   | string \| [string] | | 是 |
| exclude_tags | 不参与任务的文件标记类别 | string \| [string] | | 是 |
| expressions  | 文件标记的规则组        | [object] [结构说明](#filetagsexpressions)           | | 是 |

## file_tags.expressions

| 字段名       | 描述                     | 类型               | 默认值 | 是否必填 |
| ------------ | ------------------------ | ------------------ | ------ | -------- |
| name  | 文件标记的规则组名, 目前不参与任务逻辑 | string           | | 否 |
| kind  | 匹配模式: <br />and: 通过全部 pattern 才会被标记 tags<br />or: 通过任一 pattern 就会被标记 tags | enum | | 当存在 patterns \| files 时必填 |
| tags | 文件标记 | string \|[string] | | 是 |
| substitute | 无任何匹配规则时策略<br />always_pass: 全部标记<br />always_fail: 全部不标记 | enum | always_fail | 否 |
| patterns | 匹配规则, 若规则能匹配完整文件名, 则视为该规则通过 | string \|[string] | [] | 否 |
| files | 待匹配的文件 | string \|[string] | [] | 否 |

# 注意事项

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
