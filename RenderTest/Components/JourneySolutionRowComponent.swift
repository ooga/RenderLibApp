//
//  JourneySolutionRowComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render
import NavitiaSDK

class JourneySolutionRowComponent: ViewComponent {
    var departureTime: String = ""
    var arrivalTime: String = ""
    var totalDuration: Int32? = 0
    var walkingDuration: Int32? = 0
    var walkingDistance: Int32? = 0
    var sections: [Section] = []
    
    init(departureTime: String, arrivalTime: String, totalDuration: Int32?, walkingDuration: Int32?, walkingDistance: Int32?, sections: [Section], key: String = "", styles: Dictionary<String, Any> = [:]) {
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.totalDuration = totalDuration
        self.walkingDuration = walkingDuration
        self.walkingDistance = walkingDistance
        self.sections = sections
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
                    ComponentNode(DurationComponent(seconds: self.totalDuration!, styles: durationStyles), in: self),
                ]),
                ComponentNode(SeparatorComponent(), in: self),
                ComponentNode(JourneyRoadmapFriezeComponent(sections: self.sections), in: self),
                ComponentNode(JourneyWalkingAbstractComponent(duration: self.walkingDuration!, distance: walkingDistance!, key: self.uniqueKey + "/view/view/journeywalkingabstract"), in: self),
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
