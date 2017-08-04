//
//  ModeComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 27/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class ModeComponent: ViewComponent {
    var name: String = ""
    
    init(name: String = "", key: String = "", styles: Dictionary<String, Any> = [:]) {
        self.name = name
        super.init(key: key, styles: styles)
    }
    
    required init() {
        fatalError("ModeComponent::init() has not been implemented. You must specify the 'name' parameter in constructor")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("ModeComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: iconStyles, dict2: self.styles)
        return ComponentNode(IconComponent(name: name, styles: computedStyles), in: self)
    }
    
    let iconStyles = [
        "color": config.colors.darkerGray,
    ]
}
