# PROJECT KNOWLEDGE BASE

**Generated:** 2026-01-19
**Context:** Swift CLI (SPM), Asset Orchestration, Mission Pattern

## OVERVIEW
`abrarion` is a Swift-based CLI tool for cross-platform asset management (iOS, Android, Flutter, HarmonyOS). It operates on a **Mission-driven architecture** where tasks are defined in YAML/JSON and executed by strict "Makers".
**Stack:** Swift 5.7+, SPM, ArgumentParser, Yams, Stencil (via Stem).

## STRUCTURE
```
.
├── Package.swift           # Dependencies (WARNING: Absolute local path used)
├── sources/
│   ├── abrarion/           # CLI Entry (@main, Subcommands)
│   └── Features/           # Monolithic target for ALL logic
│       ├── Mission/        # Core Execution Engine
│       ├── XCAssets/       # Deep Domain Models (Apple Assets)
│       ├── *Maker/         # Platform implementations (Android, Flutter, etc)
│       └── Common/         # Shared Utils (Reporting, FileTags)
├── tests/
│   └── abrarionTests/      # Data-driven XCTest suite
├── scripts/                # Build & Release automation
└── .github/workflows/      # Release CI
```

## WHERE TO LOOK
| Task | Location | Notes |
|------|----------|-------|
| **CLI Config** | `Sources/abrarion/` | `abrarion.swift`, `Default.swift` |
| **Core Engine** | `Sources/Features/Mission/` | `MissionManager`, `MissionTask` |
| **Apple Assets** | `Sources/Features/XCAssets/` | Strict schema modeling |
| **Generators** | `Sources/Features/*Maker/` | Implementation of asset generation |
| **Shared Utils** | `Sources/Features/Common/` | `XCReport`, `XCFileTags` |
| **CI/Release** | `scripts/build.sh` | **Source of Truth** for release logic |

## CONVENTIONS
- **Architecture**: **Plugins ("Makers")** implement `MissionInstance`.
- **Validation**: Fail early. Use `fatalError` for invalid schema enums.
- **Reporting**: Use `XCReport.shared` for domain errors (redundancy, missing files).
- **Versioning**: Manually injected into `Sources/Features/AppInfo.swift` via `sed`.
- **Async**: `async/await` used throughout IO and Mission execution.

## ANTI-PATTERNS (THIS PROJECT)
- **DO NOT** use absolute paths in `Package.swift` (Current violation: `STFilePath`).
- **DO NOT** split logic into multiple SPM targets (Project uses Monolithic `Features`).
- **DO NOT** rely on `swift test` in CI (Currently only `publish.yml` exists).
- **DO NOT** assume file existence; strict `StemError` on missing inputs.

## COMMANDS
```bash
# Build (Universal)
./scripts/build.sh

# Run (Local)
swift run abrarion --config missions.yaml

# Test
swift test
```

## CRITICAL NOTES
1.  **Dependency**: `Package.swift` links to `/Users/linhey/Desktop/STFilePath`. **Builds will fail** without this path or a fix.
2.  **Release Redundancy**: Logic exists in `build.sh`, `Publish.swift`, and `publish.yml`. Prefer `build.sh`.
3.  **Config**: Supports `${VAR}` interpolation via `VariablesManager`.
