//
//  PlaceComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 01/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class PlaceComponent: ViewComponent {
    var name: String = ""
    
    required init(name: String?, key: String = "", styles: Dictionary<String, Any> = [:]) {
        super.init(key: key, styles: styles)
        if name != nil {
            self.name = name!
        }
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("PlaceComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: nameStyles, dict2: self.styles)
        return ComponentNode(TextComponent(text: self.name, styles: computedStyles), in: self)    }
    
    let nameStyles: [String: Any] = [
        "fontWeight": "bold",
        "marginEnd": config.metrics.marginS
    ]
}
