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
    var departureTime: Int = 0
    var arrivalTime: Int = 0
    var totalDuration: Int = 0
    var walkingDuration: Int = 0
    var walkingDistance: Int = 0
    
    init(departureTime: Int, arrivalTime: Int, totalDuration: Int, walkingDuration: Int, walkingDistance: Int, styles: Dictionary<String, Any> = [:]) {
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.totalDuration = totalDuration
        self.walkingDuration = walkingDuration
        self.walkingDistance = walkingDistance
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("JourneySolutionRowComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let timesText = timeText(timestamp: departureTime) + " - " + timeText(timestamp: arrivalTime)
        let computedStyles = self.styles
        return ComponentNode(ViewComponent(styles: computedStyles), in: self).add(children: [
            ComponentNode(ViewComponent(), in: self).add(children: [
                ComponentNode(ViewComponent(styles: journeyHeaderStyles), in: self).add(children: [
                    ComponentNode(TextComponent(text: timesText, styles: timesStyles), in: self),
                    ComponentNode(DurationComponent(minutes: self.totalDuration, styles: durationStyles), in: self),
                ]),
                ComponentNode(SeparatorComponent(), in: self),
                ComponentNode(JourneyRoadmapFriezeComponent(), in: self),
                ComponentNode(JourneyWalkingAbstractComponent(), in: self),
            ]),
        ])
    }
    
    let journeyHeaderStyles: [String: Any] = [
        "flexDirection": YGFlexDirection.row,
    ]
    let timesStyles: [String: Any] = [
        "color": config.colors.darkerGray,
        "fontWeight": "bold",
    ]
    let durationStyles: [String: Any] = [
        "alignItems": YGAlign.flexEnd,
        "justifyContent": YGJustify.flexEnd,
        "flexGrow": 1,
    ]
}
