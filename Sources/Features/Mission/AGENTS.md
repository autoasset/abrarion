# Mission: Core Execution Engine

## OVERVIEW
The `Mission` module is the central nervous system of Abrarion. It implements a mission-driven architecture where complex automation workflows are broken down into discrete, reusable tasks ("Missions").

## ARCHITECTURE
Abrarion follows a strict registry-based execution pattern:
1. **Registry**: `MissionManager` holds a mapping of keys to `MissionInstance` implementations.
2. **Context**: `MissionContext` maintains shared state, including dynamic variables (`VariablesManager`) and a shell execution environment (`StemShell`).
3. **Execution**: Missions are defined in JSON/YAML. The manager parses these definitions and invokes the corresponding instances.

## KEY SYMBOLS
- **`MissionInstance` (Protocol)**: The base interface for all tasks. Requires a `logger` and an `evaluate(from:context:)` method for execution logic.
- **`MissionManager` (Class)**: The orchestrator. Handles registration of mission types and sequential execution of tasks with performance tracking.
- **`MissionContext` (Struct)**: Carries the `VariablesManager` for `${VAR}` interpolation and `StemShell` for system commands.
- **`MissionTask` (Struct)**: A special `MissionInstance` that enables recursive task execution and loading configurations from external YAML/JSON files.

## EXTENDING
To add new functionality to Abrarion:
1. Implement the `MissionInstance` protocol in a new type.
2. Define the execution logic within the `evaluate` method.
3. Register the new instance in `MissionTask.missionManger(context:)` with a unique key.
4. Use the key in your `missions.yaml` to trigger the task.
