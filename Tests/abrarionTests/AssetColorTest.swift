//
//  File.swift
//  
//
//  Created by linhey on 2022/2/18.
//

import Foundation
@testable
import XCAssets
import Stem

class AssetColorTest: AbrarionTests {
    
    func testOutColorsets() throws {
        let config = """
        [
            {"注释": "紫 Purple", "any": "#f1ebff" },
            {"names": [ "N1" ], "any": "#9d81d6", "dark": "#8c67d6" },
            {"any": "#8c67d6" },
            {"any": "#7b4dd6" },
            {"any": "#583799" },
            {"any": "#35215c" },
        
            {"注释": "橙 Orange", "any": "#faefe6" },
            {"any": "#f0a360" },
            {"any": "#f08f3a" },
            {"any": "#f07a13" },
            {"any": "#b35b0e" },
            {"any": "#753c09" },
        
            {"注释": "蓝 Blue", "any": "#eaf0ff" },
            {"any": "#7191eb" },
            {"any": "#547ceb" },
            {"any": "#3663e0" },
            {"any": "#2748a3" },
            {"any": "#182d66" },
        
            {"注释": "绿 Green", "any": "#e1f5ec" },
            {"any": "#62cc9a" },
            {"any": "#46c288" },
            {"any": "#2cb876" },
            {"any": "#208556" },
            {"any": "#145235" },
        
            {"注释": "红 Red", "any": "#ffebeb" },
            {"any": "#eb8783" },
            {"any": "#eb635e" },
            {"any": "#eb3e38" },
            {"any": "#ad2e2a" },
            {"any": "#701e1b" },
        
            {"注释": "湖蓝 LakeBlue", "any": "#EBF5FF" },
            {"any": "#94CBFF" },
            {"any": "#6BB8FF" },
            {"any": "#42A5FF" },
            {"any": "#327CC2" },
            {"any": "#205485" },
            
            {"注释": "黑金 BlackGold", "any": "#faf2e6" },
            {"any": "#d1b07d" },
            {"any": "#c79e5f" },
            {"any": "#bd8c44" },
            {"any": "#8a6632" },
            {"any": "#57401f" },
        
            {"注释": "中性色系表与使用", "any": "#ffffff" },
            {"any": "#f7f7f7" },
            {"any": "#f0f0f0" },
            {"any": "#e8e8e8" },
            {"any": "#e0e0e0" },
            {"any": "#cccccc" },
            {"any": "#999999" },
            {"any": "#666666" },
            {"any": "#333333" },
            {"any": "#000000" }
        ]
        
        """
        let json = JSON(parseJSON: config)
        let sets = XCAssetsColor.parse(colorSets: json)
        try XCAssetsColor.createColorsetFiles(sets: sets,
                                              folder: .init(sanbox: .document).create(folder: "Abrarion").create(folder: "colorset"))
        
        try XCAssetsColor.createCodeFiles(sets: sets,
                                          template: XCAssetsColor.parse(template: nil),
                                          folder: .init(sanbox: .document).create(folder: "Abrarion").create(folder: "codes"))
    }
    
    func testContentFile() throws {
        let content = """
{
  "colors" : [
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "universal"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "universal"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "iphone"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "iphone"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "iphone"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "iphone"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "iphone"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "iphone"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "iphone"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "iphone"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "iphone"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "iphone"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "iphone"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "iphone"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "subtype" : "mac-catalyst"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "idiom" : "car"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "car"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "car"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "car"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "car"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "car"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "idiom" : "watch"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "tv"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "tv"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "tv"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "tv"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "idiom" : "mac"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "sRGB",
      "idiom" : "mac"
    },
    {
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "228",
          "green" : "64",
          "red" : "108"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "mac"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        },
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "color" : {
        "color-space" : "display-p3",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0.895",
          "green" : "0.251",
          "red" : "0.424"
        }
      },
      "display-gamut" : "display-P3",
      "idiom" : "mac"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  },
  "properties" : {
    "localizable" : true
  }
}

"""
        let set = try XCColorSet(contentFile: JSON.init(parseJSON: content))
        print(set)
    }
    
}
