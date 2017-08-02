//
//  PlaceComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 01/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class PlaceComponent: StylizedComponent {
    required override init(styles: Dictionary<String, Any>) {
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("PlaceComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: labelStyles, dict2: self.styles)
        return ComponentNode(TextComponent(text: "", styles: computedStyles), in: self).add(children: [
            ComponentNode(TextComponent(text: "20 rue Hector Malot", styles: nameStyles), in: self)
        ])
    }
    
    let nameStyles: [String: Any] = [
        "fontWeight": "bold",
    ]
    let labelStyles: [String: Any] = [
        "flexWrap": YGWrap.wrap
    ]
}
