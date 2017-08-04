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
    var departureTime: String = ""
    var arrivalTime: String = ""
    var totalDuration: Int32? = 0
    var walkingDuration: Int32? = 0
    var walkingDistance: Int = 0
    
    init(departureTime: String, arrivalTime: String, totalDuration: Int32?, walkingDuration: Int32?, walkingDistance: Int, key: String = "", styles: Dictionary<String, Any> = [:]) {
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.totalDuration = totalDuration
        self.walkingDuration = walkingDuration
        self.walkingDistance = walkingDistance
        super.init(key: key, styles: styles)
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("JourneySolutionRowComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let timesText = timeText(isoString: departureTime) + " - " + timeText(isoString: arrivalTime)
        let computedStyles = self.styles
        return ComponentNode(ViewComponent(key: "", styles: computedStyles), in: self).add(children: [
            ComponentNode(ViewComponent(), in: self).add(children: [
                ComponentNode(ViewComponent(key: "", styles: journeyHeaderStyles), in: self).add(children: [
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
