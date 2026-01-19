# XCASSETS DOMAIN

**Context:** Deep Domain Modeling
**Reason:** Complex schema validation and strict typing

## OVERVIEW
`XCAssets` provides a strict, type-safe Swift model of Apple's `.xcassets` format (`Contents.json`). It is the source of truth for all iOS/macOS asset generation.

## DOMAIN MODEL
- **`XCAsset<Content>`**: Generic container for the root JSON object.
- **`XCImage`**: Models specific image logic (scales, vector-pdf, dark mode).
- **`XCColor`**: Models color spaces (sRGB, P3) and components (0-255 or hex).

## VALIDATION STRATEGY
**Fail Early, Fail Hard.**
- **Enums**: `Idiom`, `DisplayGamut`, `Appearance` use strict string raw values.
- **Fatal Error**: `Appearances.swift` calls `fatalError()` on schema violation.
- **Initialization**: `init(from: JSON)` throws `StemError` immediately on missing required fields.

## KEY PATTERNS
- **Properties Struct**: Metadata is separated into `Properties` (e.g., `XCImageProperties`) to keep the main model clean.
- **Directional Support**: Explicitly models RTL/LTR traits (`XCImageDirection`).
- **Resizing**: `XCImageResizing` encapsulates 9-patch slicing logic.

## CONVENTIONS
- **Files**: One file per major model (e.g., `XCImage.swift`, `Devices.swift`).
- **Protocol**: `XCAssetContentProtocol` enforces `parseKey` ("images", "colors") for JSON serialization.
