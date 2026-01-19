# SOURCES/FEATURES KNOWLEDGE BASE

**Context:** Swift Monolithic Target
**Role:** Core logic hub & Mission execution engine

## OVERVIEW
`Sources/Features` is the monolithic core of `abrarion`. It contains all domain logic, platform-specific asset generators, and the "Mission" execution engine. All sub-features are grouped here to simplify dependency sharing and internal API access.

## MAKER PATTERN
The architecture follows a strict **Plugin/Maker** pattern:
- **MissionInstance**: The base protocol for all executable tasks.
- **XCMaker**: A helper protocol providing shared file-discovery and IO logic for asset makers.
- Makers are registered in the `MissionManager` and executed based on the YAML/JSON configuration.

## AVAILABLE MAKERS
| Module | Responsibility |
|--------|----------------|
| **AndroidAssetsMaker** | Generates Android `res/` (Images, Colors, Densities). |
| **FlutterAssetsMaker** | Generates Flutter assets, colors, iconfonts, and `pubspec.yaml` entries. |
| **HarmonyOSAssetsMaker**| Generates HarmonyOS specific assets and color resources. |
| **XCAssetsMaker** | Native Apple `.xcassets` generation (Images, Colors, Symbols). |
| **XCAssets** | Deep domain models for Apple's asset catalog schema. |

## CONVENTIONS
- **AppInfo.swift**: Centralized source of truth for application metadata.
    - `AppInfo.shared.version`: Injected manually via `sed` in `build.sh`.
    - `AppInfo.shared.pwd`: Stores the initial working directory for relative path resolution.
- **Monolithic Design**: DO NOT split these into separate SPM targets. Cross-module communication relies on internal access levels within this target.
- **Error Handling**: Use `StemError` for mission failures and `XCReport` for domain-level warnings (e.g., duplicate assets).
