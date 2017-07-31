//
//  JourneyRoadmapFriezeComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class JourneyRoadmapFriezeComponent: ViewComponent {
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
            ComponentNode(ContainerComponent(), in: self).add(children: [
                ComponentNode(IconComponent(iconName: "angle-right"), in: self),
                ComponentNode(JourneySectionModeComponent(), in: self)
            ])
        ])
    }
}
