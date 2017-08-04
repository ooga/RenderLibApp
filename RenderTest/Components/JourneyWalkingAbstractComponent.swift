//
//  JourneyWalkingAbstractComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 03/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Render

class JourneyWalkingAbstractComponent: ViewComponent {
    override init(key: String, styles: Dictionary<String, Any> = [:]) {
        super.init(key: key, styles: styles)
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: containerStyles, dict2: self.styles)
        return ComponentNode(ViewComponent(key: "", styles: computedStyles), in: self).add(children: [
            ComponentNode(TextComponent(text: "Dont"), in: self),
            ComponentNode(TextComponent(text: "8 min", styles: durationStyles), in: self),
            ComponentNode(TextComponent(text: "à pied (910m)"), in: self),
        ])
    }

    let containerStyles: [String: Any] = [
        "flexDirection": YGFlexDirection.row,
    ]
    let durationStyles: [String: Any] = [
        "fontWeight": "bold",
    ]
}
