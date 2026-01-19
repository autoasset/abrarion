# TEST SUITE

**Context:** Integration & Data-Driven Tests
**Reason:** High complexity asset validation

## OVERVIEW
`abrarionTests` verifies the end-to-end flow from "Config -> Mission -> Maker -> Output". It heavily uses fixtures and data-driven patterns.

## TEST STRATEGY
- **Symmetric Testing**: Parse JSON -> Model -> Encode JSON -> Compare. Ensures zero data loss.
- **Fixtures**: Located in `Resource/fixture.xcassets`.
  - `.dataset`: Zips for inputs.
  - `.imageset`: Reference images.
- **Integration**: Mocks `MissionContext` with `StemShell` to simulate CLI runs.

## KEY UTILITIES
- **`Resource`**: Helper to access `Bundle.module` assets safely.
- **`MissionMock`**: Local classes to intercept Mission execution flow.

## CONVENTIONS
- **Execution**: Run via `swift test` (uses SPM logic).
- **Async**: Tests must be `async` to match Mission architecture.
- **Validation**: Compare generated file content against expected string output/regex.
