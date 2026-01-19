# tidy_operations

`tidy_*` 系列任务用于执行文件系统操作，如复制、删除、创建文件，以及计算文件大小。

## tidy_copy (复制)

复制文件或文件夹到指定位置。

```yaml
tidy_copy:
  inputs:
    - path/to/source_file.txt
    - path/to/source_folder
  output: path/to/destination
  filter_patterns: # 可选，仅在输入为文件夹时生效
    - ".*\\.txt$"
```

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| inputs | 源文件或文件夹路径列表 | [string] | | 是 |
| output | 目标路径 (若输入为多个文件或文件夹，output 应为文件夹路径) | string | | 是 |
| filter_patterns | 文件名正则过滤列表 (仅对文件夹内的文件生效) | [string] | [] | 否 |

## tidy_create (创建)

创建新文件，支持从现有文件读取内容或直接指定文本内容。

### 从文件创建
```yaml
tidy_create:
  input: path/to/template.txt
  output: path/to/new_file.txt
```

### 从文本创建
```yaml
tidy_create:
  text: "Hello World"
  output: path/to/new_file.txt
```

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| output | 输出文件路径 | string | | 是 |
| input | 来源文件路径 | string | | 二选一 (input/text) |
| text | 直接文本内容 | string | | 二选一 (input/text) |

## tidy_delete (删除)

删除文件或文件夹。支持按正则匹配删除文件夹下的特定文件。

### 删除指定路径
```yaml
tidy_delete:
  - path/to/file1
  - path/to/folder2
```
或
```yaml
tidy_delete:
  inputs:
    - path/to/file1
    - path/to/folder2
```

### 按模式删除 (仅删除文件夹下的匹配文件)
```yaml
tidy_delete:
  inputs:
    - path/to/folder
  filter_patterns:
    - ".*\\.tmp$"
```

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| inputs | 待删除的文件或文件夹路径列表 | [string] | | 是 |
| filter_patterns | 文件名正则匹配列表 (若指定，则只删除 inputs 文件夹下匹配的文件，而不是删除整个文件夹) | [string] | [] | 否 |

## tidy_size (统计大小)

计算文件或文件夹的大小，并将结果格式化为字符串 (如 "1.5 MB") 存储到变量中。

```yaml
tidy_size:
  inputs:
    - path/to/framework
  variable: framework_size
```

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| inputs | 待统计的文件或文件夹路径列表 | [string] | | 是 |
| variable | 存储结果的变量名 | string | | 是 |
