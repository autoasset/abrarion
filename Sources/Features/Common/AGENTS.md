# COMMON UTILITIES

**Context:** Shared Utilities
**Reason:** Cross-cutting concerns
**Status:** Core Stable

## OVERVIEW
The `Common` directory contains the foundational logic shared across all Makers and Missions. It provides essential services for error reporting, file filtering, and input management, ensuring consistency in how assets are processed and validated.

## KEY UTILITIES
| Utility | Role | Key Functionality |
|---------|------|-------------------|
| `XCReport` | **Error Aggregator** | Collects redundant files, missing assets, and validation errors into a unified `abrarion_report.json`. |
| `XCFileTags` | **Filtering Engine** | Defines complex inclusion/exclusion rules using `tags`, `patterns` (regex), and logical operators (`and`, `or`, `reversed_or`). |
| `XCInputFileManager` | **File Orchestrator** | Resolves raw input paths or tag-based queries into a concrete set of `STFile` objects for processing. |

## REPORTING STRATEGY
`XCReport` follows a singleton pattern (`.shared`) to allow any component to log issues during execution without complex dependency injection.
- **Fail-Soft:** Non-critical issues (e.g., redundant files) are aggregated and reported at the end rather than crashing the process.
- **Payload Schema:** Errors are categorized into `ErrorType`, covering everything from illegal file names to missing required assets in `.contents` files.
- **CI Integration:** The generated JSON report is designed to be parsed by CI pipelines to provide feedback on asset health.
