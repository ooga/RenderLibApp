//
//  DurationComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class DurationComponent: ViewComponent {
    var minutes: Int = 0
    
    init(minutes: Int = 0, styles: Dictionary<String, Any> = [:]) {
        self.minutes = minutes
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = self.styles
        return ComponentNode(ViewComponent(styles: computedStyles), in: self).add(children: [
            ComponentNode(TextComponent(text: String(self.minutes), styles: digitsStyles), in: self),
            ComponentNode(TextComponent(text: "min", styles: abbrStyles), in: self)
        ])
    }
    
    let digitsStyles: [String: Any] = [
        "color": config.colors.tertiary,
        "fontSize": 26,
        "fontWeight": "bold",
        "marginBottom": -4,
    ]
    let abbrStyles: [String: Any] = [
        "color": config.colors.tertiary,
        "fontSize": 12,
        "marginBottom": 4,
    ]
}
