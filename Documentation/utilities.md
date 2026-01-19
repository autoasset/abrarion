# utilities

这里介绍了 `abrarion` 提供的通用工具类任务，用于执行 Shell 脚本、管理变量以及发布 CocoaPods。

## shell (执行命令)

执行 Shell 命令。支持从 `environment` 注入环境变量。

```yaml
shell:
  commands:
    - echo "Hello World"
    - ls -la
  environment:
    MY_VAR: "Hello"
  allow_errors: true
```

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| commands | 待执行的命令列表 | [string] | | 是 |
| environment | 注入的环境变量 | [string: string] | {} | 否 |
| allow_errors | 是否允许命令报错 (若为 false，命令失败将终止任务流) | bool | false | 否 |

## cocoapods_push (发布 Pod)

自动化 CocoaPods 发布流程，包含 lint 验证、版本打 tag 和 repo push。

```yaml
cocoapods_push:
  version: "1.0.0"
  podspec_url: "./MyLib.podspec"
  push_repository_url: "https://github.com/my-org/my-specs.git"
```

| 字段名 | 描述 | 类型 | 默认值 | 是否必填 |
| :--- | :--- | :--- | :--- | :--- |
| version | 待发布的版本号 (会自动创建 git tag) | string | | 是 |
| podspec_url | podspec 文件路径 | string | | 是 |
| push_repository_url | 私有 Spec 仓库的 git 地址 | string | | 是 |

**工作流程**:
1. 验证并转换 podspec 为 JSON 格式。
2. 清理空的 resource_bundles。
3. 执行 `pod lib lint`。
4. 创建 git commit 和 tag。
5. 推送 tag 到远程仓库。
6. 执行 `pod repo push`。

## variables (自定义变量)

定义可在后续任务中使用的全局变量。变量支持引用其他变量。

```yaml
variables:
  PROJECT_NAME: "MyProject"
  BUILD_DIR: "build/${PROJECT_NAME}"
```

在其他任务中使用:

```yaml
shell:
  commands:
    - echo "Building ${PROJECT_NAME} into ${BUILD_DIR}"
```

## print_variables (打印变量)

打印当前上下文中所有可用的变量，用于调试。

```yaml
print_variables:
  keys: # 可选，指定要打印的 key。如果不填则打印所有。
    - PROJECT_NAME
```
