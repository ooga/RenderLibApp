//
//  JourneySolutionRowComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class JourneySolutionRowComponent: ViewComponent {
    override init(styles: Dictionary<String, Any>) {
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        return ComponentNode(ViewComponent(), in: self).add(children: [
            ComponentNode(ViewComponent(), in: self).add(children: [
                ComponentNode(ViewComponent(), in: self).add(children: [
                    ComponentNode(TextComponent(text: "19:30 - 20:06"), in: self),
                ]),
                ComponentNode(JourneyRoadmapFriezeComponent(), in: self),
                ComponentNode(TextComponent(text: "Dont 8 min à pied (910m)"), in: self),
            ]),
            ComponentNode(ViewComponent(), in: self).add(children: [
                ComponentNode(DurationComponent(), in: self),
            ])
        ])
    }
}
