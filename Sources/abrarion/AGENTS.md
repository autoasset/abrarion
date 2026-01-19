# CLI ENTRY POINT

**Context:** Command Line Interface & Bootstrapping
**Reason:** Entry point for execution flow

## OVERVIEW
`Sources/abrarion` contains the executable entry point and subcommand definitions. It bridges the system shell to the internal `Mission` engine using `swift-argument-parser`.

## STRUCTURE
```
Sources/abrarion/
├── abrarion.swift        # @main entry point, subcommands list
├── Default.swift         # `default` subcommand (main execution logic)
├── setupShell.swift      # Shell environment initializer
└── VariablesCommand.swift # Debug command for variable inspection
```

## KEY SYMBOLS
- **`Abrarion` (Struct)**: The `@main` entry point. Inherits from `AsyncParsableCommand`.
- **`Default` (Struct)**: The workhorse subcommand.
  - Initializes `MissionContext`.
  - Sets up `StemShell`.
  - Triggers `MissionTask` to parse config and run makers.
- **`setupShell()`**: Configures the execution environment (PATH, working directory) before missions run.

## FLOW
1. **User Input**: `abrarion --config missions.yaml`
2. **Parsing**: `Abrarion` routes to `Default` command.
3. **Bootstrap**: `Default.run()` creates `MissionContext`.
4. **Handoff**: Invokes `MissionTask().evaluate(...)` to start the Mission engine.

## CONVENTIONS
- **No Global Main**: Uses `@main` attribute, not `main.swift`.
- **Async Execution**: All commands are `AsyncParsableCommand` to support async mission execution.
