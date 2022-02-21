//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
@testable
import XCAssets
import Stem

class AssetImageTest: AbrarionTests {

    func testParseContent() async throws {
let content = """
{
  "images" : [
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "filename" : "top_close@2x.png",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "filename" : "top_close@3x.png",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "resizing" : {
        "cap-insets" : {
          "bottom" : 36,
          "left" : 35,
          "right" : 36,
          "top" : 35
        },
        "center" : {
          "height" : 1,
          "mode" : "tile",
          "width" : 1
        },
        "mode" : "9-part"
      },
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "universal",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "iphone",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "3x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "1x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "sRGB",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
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
      "display-gamut" : "display-P3",
      "height-class" : "compact",
      "idiom" : "ipad",
      "language-direction" : "right-to-left",
      "scale" : "2x",
      "subtype" : "mac-catalyst",
      "width-class" : "regular"
    },
    {
      "idiom" : "car",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "idiom" : "car",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "car",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "idiom" : "car",
      "language-direction" : "right-to-left"
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
      "idiom" : "car",
      "language-direction" : "right-to-left"
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
      "idiom" : "car",
      "language-direction" : "right-to-left"
    },
    {
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "3x"
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
      "idiom" : "car",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "idiom" : "watch",
      "language-direction" : "right-to-left"
    },
    {
      "idiom" : "watch",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "idiom" : "watch",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "idiom" : "watch",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "graphics-feature-set" : "apple4",
      "idiom" : "tv",
      "language-direction" : "right-to-left",
      "memory" : "1GB",
      "scale" : "2x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
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
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
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
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "sRGB",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "contrast",
          "value" : "high"
        }
      ],
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
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
      "display-gamut" : "display-P3",
      "idiom" : "mac",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  },
  "properties" : {
    "auto-scaling" : "auto",
    "compression-type" : "lossless",
    "localizable" : true,
    "preserves-vector-representation" : true,
    "template-rendering-intent" : "original"
  }
}

"""
        let json = JSON(parseJSON: content)
        let set = try await XCImageSet(contentFile: json)
        print(set.properties.toJSON)
    }

}
