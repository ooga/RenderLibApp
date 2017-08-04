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
        fatalError("JourneyRoadmapFriezeComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: containerStyles, dict2: self.styles)
        return ComponentNode(ViewComponent(styles: computedStyles), in: self).add(children: [
            ComponentNode(SeparatorComponent(), in: self),
            ComponentNode(ViewComponent(styles: modeListStyles), in: self).add(children: [
                ComponentNode(JourneySectionAbstractComponent(mode: "bus", duration: 100, lineCode: "6", color: UIColor.red), in: self),
                ComponentNode(JourneySectionAbstractComponent(mode: "tramway", duration: 51, lineCode: "A", color: UIColor.blue), in: self),
                ComponentNode(JourneySectionAbstractComponent(mode: "tramway", duration: 25, lineCode: "C1", color: UIColor.brown), in: self),
            ])
        ])
    }
    
    let containerStyles: [String: Any] = [
        "flexDirection": YGFlexDirection.row,
    ]
    let modeListStyles: [String: Any] = [
        "paddingTop": config.metrics.marginL,
        "paddingBottom": config.metrics.marginL,
        "flexDirection": YGFlexDirection.row,
        "flexGrow": 1,
        "marginEnd": config.metrics.margin * -1
    ]
}
