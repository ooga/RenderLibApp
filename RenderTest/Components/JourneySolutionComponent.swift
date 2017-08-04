//
//  JourneySolutionComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render
import NavitiaSDK

class JourneySolutionComponent: ViewComponent {
    var journey: Journey = Journey()
    
    init(journey: Journey, key: String = "", styles: Dictionary<String, Any> = [:]) {
        super.init(key: key, styles: styles)
        self.journey = journey
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: listStyles, dict2: self.styles)
        return ComponentNode(ListRowComponent(key: "", styles: computedStyles), in: self).add(children: [
            ComponentNode(JourneySolutionRowComponent(departureTime: journey.departureDateTime!, arrivalTime: journey.arrivalDateTime!, totalDuration: journey.duration, walkingDuration: journey.durations?.walking, walkingDistance: 0), in: self)
        ])
    }
    
    let listStyles:[String: Any] = [
        "backgroundColor": config.colors.white,
        "padding": config.metrics.marginL,
        "paddingTop": 4,
        "borderRadius": config.metrics.radius,
        "marginBottom": config.metrics.margin,
        "shadowRadius": CGFloat(2),
        "shadowOpacity": 0.12,
        "shadowOffset": [0, 0],
        "shadowColor": UIColor.black,
    ]
}
