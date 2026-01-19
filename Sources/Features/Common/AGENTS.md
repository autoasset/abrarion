# COMMON UTILITIES

**Context:** Shared Infrastructure
**Reason:** Cross-cutting concerns for all Makers

## OVERVIEW
`Sources/Features/Common` provides the shared toolkit for file discovery, asset tagging, and error reporting.

## KEY COMPONENTS
- **`XCInputFileManager`**: The query engine. Finds files based on:
  - `inputs`: Raw paths.
  - `tags`: Inclusion/exclusion logic.
  - `patterns`: Regex matching.
- **`XCImageMark`**: The parser.
  - Detects scale (`@2x`, `@3x`).
  - Detects dark mode (`_dark`).
  - Identifies format (SVG, PNG, PDF).
- **`XCReport`**: The auditor.
  - Singleton (`.shared`) error collector.
  - Generates `abrarion_report.json` at the end of execution.

## CONVENTIONS
- **Tags**: Used heavily to filter assets for different platforms (e.g., `tag: "android"` vs `tag: "ios"`).
- **Fail-Soft**: `XCReport` accumulates errors; does not crash execution unless critical.
