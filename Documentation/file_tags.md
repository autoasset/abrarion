# file_tags

`file_tags` 提供了一种灵活的文件筛选机制，用于替代简单的文件路径列表 (`inputs`)。它允许通过标签、正则匹配、文件列表等方式组合筛选文件。

## 结构说明

### XCFileTags

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| vaild_tags | 有效的标签列表 (只保留包含这些标签的文件) | [string] | | 否 |
| exclude_tags | 排除的标签列表 (排除包含这些标签的文件) | [string] | | 否 |
| expressions | 表达式列表 (定义如何给文件打标签) | [Expression](#expression)[] | | 是 |

### Expression

定义一组文件并将它们标记为特定的 `tags`。

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| name | 表达式名称 (用于调试/报错) | string | | 是 |
| tags | 赋予匹配文件的标签列表 | [string] | | 是 |
| patterns | 正则表达式列表 (匹配文件路径) | [string] | | 否 |
| inputs | 输入文件路径列表 (直接指定文件) | [string] | | 否 |
| files | 包含匹配规则的文件路径列表 (从文件中读取正则规则，每行一个) | [string] | | 否 |
| kind | 匹配逻辑 (`or`, `and`, `reversed_or`) | enum | `and` (仅当 patterns 为空时默认，否则必填) | 否 |
| substitute | 无匹配规则时的替代行为 (`always_pass`, `always_fail`) | enum | `always_fail` | 否 |

**匹配逻辑 (kind)**:
- `or`: 满足任一 pattern 即匹配。
- `and`: 必须满足所有 pattern 才匹配。
- `reversed_or`: 满足任一 pattern 则 **不** 匹配 (反向筛选)。

**注意**: 若指定了 `patterns` 或 `files` (即存在匹配规则)，则必须显式指定 `kind`。

## 示例

### 1. 简单打标签 (全部标记)

```yaml
file_tags:
  vaild_tags: ["flutter"]
  expressions:
    - name: flutter_assets
      inputs:
        - products/flutter/2.0x
        - products/flutter/3.0x
      tags: ["flutter"]
      substitute: always_pass
```

### 2. 通过正则筛选 (白名单)

```yaml
file_tags:
  vaild_tags: ["ios"]
  expressions:
    - name: ios_filter
      inputs: ["assets/mixed"]
      tags: ["ios"]
      kind: or
      patterns:
        - ".*_ios\\.png$"
        - ".*_common\\.png$"
```

### 3. 通过文件列表筛选

```yaml
# rules.txt 内容:
# ^icon_.*
# ^bg_.*

file_tags:
  vaild_tags: ["valid_icons"]
  expressions:
    - name: icon_filter
      inputs: ["assets/images"]
      tags: ["valid_icons"]
      kind: or
      files: ["rules.txt"]
```

### 4. 排除特定文件 (黑名单)

```yaml
file_tags:
  vaild_tags: ["all"]
  exclude_tags: ["draft"]
  expressions:
    - name: all_files
      inputs: ["assets"]
      tags: ["all"]
      substitute: always_pass
      
    - name: draft_filter
      inputs: ["assets"]
      tags: ["draft"]
      kind: or
      patterns: ["^draft_.*"]
```
