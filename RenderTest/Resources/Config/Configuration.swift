//
//  Configuration.swift
//  RenderTest
//
//  Created by Thomas Noury on 02/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import UIKit

struct Configuration {
    struct MetricConfiguration {
        let space = 4
        let radius = 0
        let marginS = 4
        let margin = 8
        let marginL = 16
        let timeFormat = "HH:mm"
        let shortDateFormat = "dd/MM/YYYY"
        let longDateFormat = "EEE d MMM - HH:mm"
    }
    
    struct ColorConfiguration {
        // #37ab2e
        // let primary = UIColor(red:0.21, green:0.67, blue:0.18, alpha:1.0)
        let primary = UIColor(red:0.40, green:0.40, blue:0.40, alpha:1.0)
        let secondary = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
        // let tertiary = UIColor(red:0.00, green:0.62, blue:0.88, alpha:1.0)
        let tertiary = UIColor(red:0.21, green:0.67, blue:0.18, alpha:1.0)
        let white = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        let lighterGray = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
        let lightGray = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        let gray = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        let darkGray = UIColor(red:0.25, green:0.25, blue:0.25, alpha:1.0)
        let darkerGray = UIColor(red:0.12, green:0.12, blue:0.12, alpha:1.0)
        let origin = UIColor(red:0.59, green:0.75, blue:0.05, alpha:1.0)
        let destination = UIColor(red:0.89, green:0.00, blue:0.48, alpha:1.0)
    }
    
    let iconFontCodes:[String: String] = [
        "address": "\u{ea02}",
        "administrative-region": "\u{ea03}",
        "air": "\u{ea04}",
        "arrow-details-down": "\u{ea05}",
        "arrow-details-up": "\u{ea06}",
        "arrow-direction-left": "\u{ea07}",
        "arrow-direction-right": "\u{ea08}",
        "arrow-direction-straight": "\u{ea09}",
        "arrow-left-long": "\u{ea0a}",
        "arrow-right-long": "\u{ea0b}",
        "arrow-right": "\u{ea0c}",
        "bike": "\u{ea0d}",
        "ferry": "\u{ea0e}",
        "bss": "\u{ea0f}",
        "bus": "\u{ea10}",
        "calendar": "\u{ea11}",
        "car": "\u{ea12}",
        "clock": "\u{ea13}",
        "coach": "\u{ea14}",
        "destination": "\u{ea15}",
        "direction": "\u{ea16}",
        "edit": "\u{ea17}",
        "funicular": "\u{ea18}",
        "geolocation": "\u{ea19}",
        "home": "\u{ea1a}",
        "metro": "\u{ea1b}",
        "notice": "\u{ea1c}",
        "origin": "\u{ea1d}",
        "poi": "\u{ea1e}",
        "realtime": "\u{ea1f}",
        "stop": "\u{ea21}",
        "localtrain": "\u{ea23}",
        "rapidtransit": "\u{ea23}",
        "longdistancetrain": "\u{ea23}",
        "tramway": "\u{ea24}",
        "walking": "\u{ea25}",
        "work": "\u{ea26}",
    ]
    
    let colors = ColorConfiguration()
    let metrics = MetricConfiguration()
}

let config = Configuration()
