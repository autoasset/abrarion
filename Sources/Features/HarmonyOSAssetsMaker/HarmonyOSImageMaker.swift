//
//  HarmonyOSImageMaker.swift
//
//
//  Created by abrarion on 2026/1/12.
//

import Logging
import STFilePath
import STJSON
import Stem

public struct HarmonyOSImageMaker: MissionInstance, XCMaker {

    struct CustomInput {
        let density: HarmonyOSDensity
        let tags: [String]
        let isDark: Bool

        public init(from json: JSON, variables: VariablesManager) async throws {
            let densityValue = try await variables.parse(json["density"].stringValue)
            guard let density = HarmonyOSDensity(rawValue: densityValue) else {
                throw StemError("harmonyos density error: \(densityValue)")
            }
            self.tags = try await variables.parse(json["tags"].stringArrayValue)
            self.density = density
            self.isDark = json["dark"].boolValue
        }
    }

    public struct Options {

        let output_resources_path: STFolder
        let inputs: XCInputsOptions
        let substitute_inputs: [CustomInput]
        let custom_inputs: [CustomInput]
        let dark_mode_enabled: Bool

        public init(from json: JSON, variables: VariablesManager) async throws {
            self.inputs = try await XCInputsOptions(from: json, variables: variables)
            guard json["output_resources_path"].isExists else {
                throw StemError("HarmonyOSImageMaker: 未包含必要参数 output_resources_path")
            }
            self.output_resources_path = STFolder(
                try await variables.parse(json["output_resources_path"].stringValue))
            self.substitute_inputs = try await json["substitute_inputs"].arrayValue.asyncMap({
                json in
                try await CustomInput(from: json, variables: variables)
            })
            self.custom_inputs = try await json["custom_inputs"].arrayValue.asyncMap({ json in
                try await CustomInput(from: json, variables: variables)
            })
            self.dark_mode_enabled = json["dark_mode_enabled"].bool ?? true
        }

    }

    public var logger: Logger?

    public init() {}

    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)

        let manager = try await XCInputFileManager(options.inputs)
        let vaild_files = try await manager.vaild_files()

        let resources = options.output_resources_path
        let marked = XCImageMark.marked(vaild_files)
        let maxScale = marked.keys.compactMap { kind -> Int? in
            switch kind {
            case .scale(let scale), .gif(let scale):
                return scale
            default:
                return nil
            }
        }.max()

        try marked.forEach { item in
            let density: HarmonyOSDensity
            switch item.key {
            case .scale(let scale), .gif(let scale):
                guard let temp = self.density(from: scale) else {
                    return
                }
                density = temp
            case .vector:
                // HarmonyOS 支持 SVG，放入 base/media
                density = .base
            case .android_vector:
                // Android vector drawable 不支持
                return
            case .unrecognisedGIFScale:
                guard let scale = maxScale else {
                    return
                }
                density = self.density(from: scale) ?? .xxldpi
            case .unrecognisedScale, .unknown:
                return
            }

            try self.processFiles(
                item.value,
                density: density,
                resources: resources,
                isReplace: true,
                darkModeEnabled: options.dark_mode_enabled
            )
        }

        // 处理 substitute_inputs（不替换已有文件）
        try await options.substitute_inputs.asyncForEach { input in
            let files = try await manager.files(tags: input.tags)
            guard files.isEmpty == false else {
                return
            }
            try self.processFiles(
                .init(files),
                density: input.density,
                resources: resources,
                isReplace: false,
                isDarkOverride: input.isDark,
                darkModeEnabled: options.dark_mode_enabled
            )
        }

        // 处理 custom_inputs（替换已有文件）
        try await options.custom_inputs.asyncForEach { input in
            let files = try await manager.files(tags: input.tags)
            guard files.isEmpty == false else {
                return
            }
            try self.processFiles(
                .init(files),
                density: input.density,
                resources: resources,
                isReplace: true,
                isDarkOverride: input.isDark,
                darkModeEnabled: options.dark_mode_enabled
            )
        }
    }

}

extension HarmonyOSImageMaker {

    /// Scale 到 HarmonyOS 密度的映射
    fileprivate func density(from scale: Int) -> HarmonyOSDensity? {
        switch scale {
        case 1: return .mdpi  // 1x -> mdpi
        case 2: return .xldpi  // 2x -> xldpi
        case 3: return .xxldpi  // 3x -> xxldpi
        case 4: return .xxxldpi  // 4x -> xxxldpi
        default: return nil
        }
    }

    /// 处理文件名，移除 scale 后缀
    fileprivate func harmonyos_filename(_ file: STFile) -> String {
        XCImageMark.filename(noScaleFactor: file)
    }

    /// 检查文件是否为暗黑模式资源
    fileprivate func isDarkModeFile(_ file: STFile) -> Bool {
        let name = file.attributes.name.lowercased()
        return ["_dark@", "_dark.", "-dark@", "-dark."].contains(where: { name.contains($0) })
    }

    /// 处理文件到对应目录
    fileprivate func processFiles(
        _ files: Set<STFile>,
        density: HarmonyOSDensity,
        resources: STFolder,
        isReplace: Bool,
        isDarkOverride: Bool? = nil,
        darkModeEnabled: Bool
    ) throws {

        for file in files {
            let isDark: Bool
            if let override = isDarkOverride {
                isDark = override
            } else {
                isDark = darkModeEnabled && isDarkModeFile(file)
            }

            let folderPath = isDark ? density.darkMediaPath : density.mediaPath
            let folder = resources.folder(folderPath)
            _ = try? folder.create()

            let targetFilename = harmonyos_filename(file)
            let targetFile = folder.file(targetFilename)

            if targetFile.isExists {
                if isReplace {
                    try targetFile.delete()
                } else {
                    continue
                }
            }

            try file.replace(folder.file(targetFilename))
        }
    }
}
