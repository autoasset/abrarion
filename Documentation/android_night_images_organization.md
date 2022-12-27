# android_night_images_organization

> 用于组织 android 暗夜模式产物

# 字段说明

| 字段名       | 描述                     | 类型               | 默认值 | 是否必填 |
| ------------ | ------------------------ | ------------------ | ------ | -------- |
| output_resources_path | android resources 文件夹位置, 用于资源拷贝 | string |  | 是 |
| is_remove_orphan_file | 是否移除孤儿文件, a.png 与 a_dark.png 必须成对出现, 否则 a_dark.png 将被删除 |   bool | true | 否 |