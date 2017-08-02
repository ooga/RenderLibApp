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
        let radius = 5
        let marginS = 4
        let margin = 8
        let marginL = 16
    }
    
    struct ColorConfiguration {
        let primary = UIColor(red:0.40, green:0.40, blue:0.40, alpha:1.0)
        let secondary = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
        let tertiary = UIColor(red:0.00, green:0.62, blue:0.88, alpha:1.0)
        let white = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        let lighterGray = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
        let lightGray = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        let gray = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        let darkGray = UIColor(red:0.25, green:0.25, blue:0.25, alpha:1.0)
        let darkerGray = UIColor(red:0.12, green:0.12, blue:0.12, alpha:1.0)
        let origin = UIColor(red:0.59, green:0.75, blue:0.05, alpha:1.0)
        let destination = UIColor(red:0.89, green:0.00, blue:0.48, alpha:1.0)
    }
    
    let colors = ColorConfiguration()
    let metrics = MetricConfiguration()
}

let config = Configuration()
