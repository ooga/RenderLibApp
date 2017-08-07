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
    var seconds: Int32 = 0
    
    init(seconds: Int32 = 0, key: String = "", styles: Dictionary<String, Any> = [:]) {
        self.seconds = seconds
        super.init(key: key, styles: styles)
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = self.styles
        return ComponentNode(ViewComponent(key: self.uniqueKey + "/view", styles: computedStyles), in: self).add(children: [
            ComponentNode(TextComponent(text: String(self.seconds / 60), styles: digitsStyles), in: self),
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
