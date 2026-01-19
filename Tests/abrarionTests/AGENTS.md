# AGENTS.md - Tests/abrarionTests

## OVERVIEW
The `abrarionTests` suite is an XCTest-based collection designed to verify the Mission execution engine, Asset domain models, and platform-specific Makers. It provides high-coverage validation for cross-platform asset orchestration logic, ensuring reliability across iOS, Android, HarmonyOS, and Flutter outputs. This suite is critical for maintaining the integrity of asset transformations and CLI command behaviors.

## TEST STRATEGY
- **Data-Driven Validation**: Tests heavily utilize raw JSON strings or external fixtures to simulate complex Mission configurations. This allows for rapid iteration on schema changes without modifying core test logic.
- **Symmetric Testing**: A core pattern where assets are parsed from JSON and then re-encoded to ensure zero data loss during serialization cycles (e.g., `XCAsset<XCColor>`).
- **Asynchronous Execution**: Fully utilizes Swift's `async/await` to test the non-blocking nature of the `MissionManager` and various Makers.
- **Execution Command**: Tests should be run via SPM to ensure the `Resource` bundle is correctly synthesized:
  `swift test --filter abrarionTests`

## RESOURCE HANDLING
Test assets are centralized in the `Resource/` directory and accessed via the `Resource` utility struct:
- **Module Bundle**: Accesses fixtures using `Bundle.module` via `NSDataAsset`.
- **Fixtures**: Located in `fixture.xcassets`, including:
  - `.colorset` / `.symbolset` for domain model validation.
  - `.dataset` containing `.zip` archives (e.g., `iconfont.zip`) for integration tests.
  - `.imageset` for verifying resizing and cap-insets logic.
- **Data Retrieval**: `Resource.data(for:)` provides a clean API for fetching test data by name.
- **Maintenance**: To add fixtures, place them in `fixture.xcassets`, update `Resource.swift`, and reference them in your `XCTestCase`.

## PATTERNS
- **Mission Mocks**: Tests define local `MissionInstance` classes to intercept `JSON` inputs and verify task forwarding/merging logic in `MissionManager`.
- **Shell Integration**: `MissionContext` is initialized with `StemShell.Instance`, enabling tests to track shell command execution or provide mocked shell environments.
- **Schema Assertions**: Exhaustive property checks (idiom, scale, appearances, contrast) ensure that the strict `XCAssets` schema is correctly mapped from source files.
- **Error Propagation**: Verifies that `StemError` is thrown correctly for invalid configurations or missing required input files.
- **Platform Specifics**: Includes specialized tests for HarmonyOS color diffing and IconFont generation logic.
- **File System Assertions**: Uses `STFilePath` to verify that generated assets are correctly written to the expected directory structure.
