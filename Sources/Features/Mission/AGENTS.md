# MISSION ENGINE

**Context:** Core Architecture / Plugin System
**Reason:** Central orchestration logic

## OVERVIEW
The `Mission` module is the nervous system of `abrarion`. It implements the plugin registry and execution loop that drives all asset generation.

## ARCHITECTURE
- **Registry Pattern**: `MissionManager` holds a map of `String` (key) -> `MissionInstance` (Maker).
- **Recursive Execution**: `MissionTask` is itself a `MissionInstance`, allowing missions to trigger other missions (nested workflows).
- **Context Propagation**: `MissionContext` passes `VariablesManager` and `StemShell` to every task.

## KEY SYMBOLS
| Symbol | Role | Notes |
|--------|------|-------|
| `MissionInstance` | **Protocol** | Base interface for ALL makers. Requires `evaluate(json:context:)`. |
| `MissionManager` | **Orchestrator** | Registers makers, measures performance, executes tasks sequentially. |
| `MissionTask` | **Factory/Root** | The "Master" mission. Registers all Makers in `missionManger(context:)`. |

## EXTENSION POINT
To add a new platform (e.g., "Tizen"):
1. Create `TizenMaker` conforming to `MissionInstance`.
2. Register it in `MissionTask.swift`: `manager.register(TizenMaker(), for: "tizen_assets")`.
3. Use key `"tizen_assets"` in YAML config.

## CONVENTIONS
- **Performance**: Manager logs execution duration for every task.
- **Config**: Supports external config files via `path` argument in JSON/YAML.
