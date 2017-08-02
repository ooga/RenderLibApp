//
//  SeparatorComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class SeparatorComponent: ViewComponent {
    required override init(styles: Dictionary<String, Any>) {
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: lineStyles, dict2: self.styles)
        return ComponentNode(ViewComponent(styles: computedStyles), in: self)
    }
    
    let lineStyles: [String: Any] = [
        "height": 1,
        "backgroundColor": config.colors.secondary
    ]
}
