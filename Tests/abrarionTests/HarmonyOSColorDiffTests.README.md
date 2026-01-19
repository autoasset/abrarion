# HarmonyOSColorDiffTests 使用说明

## 功能说明

`HarmonyOSColorDiffTests` 提供了比对两个 HarmonyOS 颜色 JSON 文件差异的功能。

## 使用方法

### 1. 基本用法

```swift
let test = HarmonyOSColorDiffTests()

// 比对两个文件
let differences = try test.compareColorFiles(
    oldPath: "/path/to/old/color.json",
    newPath: "/path/to/new/color.json"
)

// 打印差异
test.printDifferences(differences)
```

### 2. 运行测试示例

```bash
cd /Users/linhey/Desktop/abrarion
swift test --filter HarmonyOSColorDiffTests.testColorComparisonLogic
```

### 3. 比对实际文件

修改 `testColorDifference()` 方法:

```swift
func testColorDifference() throws {
    let oldPath = "/path/to/old/color.json"
    let newPath = "/path/to/new/color.json"
    
    let differences = try compareColorFiles(oldPath: oldPath, newPath: newPath)
    printDifferences(differences)
    
    // 如果有差异，测试失败
    XCTAssertTrue(differences.isEmpty, "发现颜色差异")
}
```

## 输出示例

```
发现 3 个颜色差异:

➕ 新增颜色 (1):
  + yellow_1: #FFFF00

➖ 删除颜色 (1):
  - green_1: #00FF00

🔄 修改颜色 (1):
  ~ blue_1:
    旧值: #0000FF
    新值: #0000EE
```

## API 说明

### compareColorFiles

比对两个颜色 JSON 文件。

```swift
func compareColorFiles(oldPath: String, newPath: String) throws -> [ColorDifference]
```

### compareColors

比对两个颜色数组。

```swift
func compareColors(old: [ColorItem], new: [ColorItem]) -> [ColorDifference]
```

### printDifferences  

打印差异信息到控制台。

```swift
func printDifferences(_ differences: [ColorDifference])
```

## 数据结构

### ColorItem

```swift
struct ColorItem: Codable, Equatable {
    let name: String   // 颜色名称
    let value: String  // 颜色值 (hex格式)
}
```

### ColorDifference

```swift
enum ColorDifference {
    case added(ColorItem)                        // 新增
    case removed(ColorItem)                      // 删除
    case modified(old: ColorItem, new: ColorItem) // 修改
}
```
