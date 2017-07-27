//
//  JourneyRoadmapFriezeComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

func JourneyRoadmapFriezeComponent() -> NodeType {
    return ViewComponent().add(children: [
        ContainerComponent().add(children: [
            IconComponent(iconName: "angle-right"),
            JourneySectionModeComponent()
        ])
    ])
}
