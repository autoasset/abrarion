# XCAssets Knowledge Base

**Generated:** 2026-01-19
**Context:** Deep Domain Modeling (Apple Assets)

## OVERVIEW
The `XCAssets` module provides a high-fidelity Swift implementation of Apple's `.xcassets` catalog format. It models the hierarchical structure and strict JSON schema required by Xcode for asset orchestration and cross-platform generation.

- **Complexity:** ~20 files covering images, colors, data, and symbols.
- **Objective:** Type-safe manipulation and validation of `Contents.json` files.

## DOMAIN MODEL
The system uses a generic `XCAsset<Content>` container where `Content` conforms to `XCAssetContentProtocol`.

### Core Components
- **XCImage**: Models image variations including filename, scale, and traits.
- **XCColor**: Models color definitions (RGB/CMYK) and appearances.
- **XCData**: Models raw data assets with compression settings.
- **XCSymbol**: Models SF Symbol configurations.

### Environmental Traits
- **Devices (Idiom)**: `universal`, `iphone`, `ipad`, `mac`, `watch`, `tv`, `carplay`.
- **Appearances**: `luminosity` (light/dark) and `contrast` (high).
- **DisplayGamut**: `sRGB` and `display-P3`.
- **Memory**: Support for specialized memory constraints (e.g., `1GB`, `2GB`).
- **Graphics**: Support for Metal-specific features (e.g., `metal`, `apple7`).

## VALIDATION RULES
The module enforces strict schema compliance to ensure generated assets are valid for Xcode:

1. **Enum Safety**: All trait-related enums (Idiom, Gamut, Appearance) use explicit raw values matching Apple's schema. Invalid or unrecognized JSON keys trigger `fatalError` to prevent silent corruption.
2. **Type-Safe Properties**: Each content type defines an associated `Properties` struct (e.g., `XCImageProperties`) to handle specific metadata like `template-rendering` or `compression-type`.
3. **Directional Support**: Explicit modeling of `XCImageDirection` for Right-to-Left (RTL) language support.
4. **Resizing Logic**: `XCImageResizing` encapsulates slicing and center-fill logic for 9-patch style scaling.
5. **Protocol Enforcement**: `XCAssetContentProtocol` requires a static `parseKey` (e.g., "images", "colors") ensuring correct JSON serialization.
