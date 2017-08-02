//
//  Icons.swift
//  RenderTest
//
//  Created by Thomas Noury on 01/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import UIKit

func fetchIcon(name: String) -> String {
    var returnValue = "\u{ffff}"
    
    switch name {
    case "address": returnValue = "\u{ea02}"; break
    case "administrative-region": returnValue = "\u{ea03}"; break
    case "air": returnValue = "\u{ea04}"; break
    case "arrow-details-down": returnValue = "\u{ea05}"; break
    case "arrow-details-up": returnValue = "\u{ea06}"; break
    case "arrow-direction-left": returnValue = "\u{ea07}"; break
    case "arrow-direction-right": returnValue = "\u{ea08}"; break
    case "arrow-direction-straight": returnValue = "\u{ea09}"; break
    case "arrow-left-long": returnValue = "\u{ea0a}"; break
    case "arrow-right-long": returnValue = "\u{ea0b}"; break
    case "arrow-right": returnValue = "\u{ea0c}"; break
    case "bike": returnValue = "\u{ea0d}"; break
    case "boat": returnValue = "\u{ea0e}"; break
    case "bss": returnValue = "\u{ea0f}"; break
    case "bus": returnValue = "\u{ea10}"; break
    case "calendar": returnValue = "\u{ea11}"; break
    case "car": returnValue = "\u{ea12}"; break
    case "clock": returnValue = "\u{ea13}"; break
    case "coach": returnValue = "\u{ea14}"; break
    case "destination": returnValue = "\u{ea15}"; break
    case "direction": returnValue = "\u{ea16}"; break
    case "edit": returnValue = "\u{ea17}"; break
    case "funicular": returnValue = "\u{ea18}"; break
    case "geolocation": returnValue = "\u{ea19}"; break
    case "home": returnValue = "\u{ea1a}"; break
    case "metro": returnValue = "\u{ea1b}"; break
    case "notice": returnValue = "\u{ea1c}"; break
    case "origin": returnValue = "\u{ea1d}"; break
    case "poi": returnValue = "\u{ea1e}"; break
    case "realtime": returnValue = "\u{ea1f}"; break
    case "shuttle": returnValue = "\u{ea20}"; break
    case "stop": returnValue = "\u{ea21}"; break
    case "taxi": returnValue = "\u{ea22}"; break
    case "train": returnValue = "\u{ea23}"; break
    case "tramway": returnValue = "\u{ea24}"; break
    case "walking": returnValue = "\u{ea25}"; break
    case "work": returnValue = "\u{ea26}"; break
    default: returnValue = "\u{ffff}"
    }
    
    return returnValue
}

public extension String {
    public static func fontString(name: String) -> String {
        return fetchIcon(name: name)
    }
}

public extension UIFont {
    class func iconFontOfSize(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        if (font != nil) {
            return font!
        } else {
            NSLog("Font " + name + " not found")
            return UIFont.systemFont(ofSize: 14)
        }
    }
}

public extension NSMutableAttributedString {
    public static func fontAwesomeAttributedString(name: String, suffix: String?, iconSize: CGFloat, suffixSize: CGFloat?) -> NSMutableAttributedString {
        var iconString = fetchIcon(name: name)
        var suffixFontSize = iconSize

        if let suffix = suffix {
            iconString = iconString + suffix
        }
        if let suffixSize = suffixSize {
            suffixFontSize = suffixSize
        }

        let iconAttributed = NSMutableAttributedString(string: iconString, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue", size: suffixFontSize)!])
        iconAttributed.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(name: "Product", size: iconSize), range: NSRange(location: 0, length: 1))
        
        return iconAttributed
    }
}
