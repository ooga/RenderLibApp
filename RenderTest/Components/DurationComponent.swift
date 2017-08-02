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
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: textStyles, dict2: self.styles)
        return ComponentNode(TextComponent(text: "57", styles: computedStyles), in: self)
    }
    
    let textStyles:[String: Any] = [
        "color": config.colors.tertiary,
    ]
}
