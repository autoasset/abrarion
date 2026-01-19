# FEATURES MONOLITH

**Context:** Shared Logic & Makers
**Reason:** Main library target containing all business logic

## OVERVIEW
`Sources/Features` is the monolithic library target. It contains the Core (`Mission`), Domain (`XCAssets`), Utilities (`Common`), and all Platform Makers.

## MODULE MAP
| Directory | Role |
|-----------|------|
| `Mission/` | Execution Engine & Registry |
| `XCAssets/` | Apple Asset Domain Models |
| `Common/` | Shared Utils (File discovery, Reporting) |
| `*Maker/` | Platform-specific Generators |

## MAKER PATTERN
All `*Maker` modules (Android, Flutter, HarmonyOS) share a common structure:
1. **Conform** to `MissionInstance`.
2. **Use** `XCInputFileManager` (from `Common`) to find files.
3. **Use** `XCImageMark` (from `Common`) to parse scales/types.
4. **Generate** platform-specific files (XML, JSON, Dart).

## COMMON UTILITIES
- **`XCInputFileManager`**: Resolves `tags` and `patterns` to file paths.
- **`XCReport.shared`**: Singleton for collecting non-fatal warnings (duplicates, missing files).
- **`AppInfo`**: Source of truth for Version and PWD.

## CONVENTIONS
- **Monolith**: DO NOT split into sub-targets. Internal access allowed across features.
- **Error Handling**: Throw `StemError` for fatal issues; log to `XCReport` for warnings.
