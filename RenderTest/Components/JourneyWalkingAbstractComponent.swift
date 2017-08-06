//
//  JourneyWalkingAbstractComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 03/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Render

class JourneyWalkingAbstractComponent: ViewComponent {
    var duration: Int32 = 0
    var distance: Int32 = 0
    
    init(duration: Int32, distance: Int32, key: String, styles: Dictionary<String, Any> = [:]) {
        super.init(key: key, styles: styles)
        self.duration = duration
        self.distance = distance
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
            ComponentNode(TextComponent(text: "Dont "), in: self),
            ComponentNode(TextComponent(text: String(self.duration / 60) + " min", styles: durationStyles), in: self),
            ComponentNode(TextComponent(text: " à pied (" + distanceText(meters: self.distance) + ")"), in: self),
        ])
    }

    let containerStyles: [String: Any] = [
        "flexDirection": YGFlexDirection.row,
    ]
    let durationStyles: [String: Any] = [
        "fontWeight": "bold",
    ]
}
