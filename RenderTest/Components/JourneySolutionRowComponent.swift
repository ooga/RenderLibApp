//
//  JourneySolutionRowComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

func JourneySolutionRowComponent() -> NodeType {
    return ViewComponent().add(children: [
        ViewComponent().add(children: [
            ViewComponent().add(children: [
                TextComponent(text: "19:30 - 20:06")
            ]),
            JourneyRoadmapFriezeComponent(),
            TextComponent(text: "Dont 8 min à pied (910m)")
        ]),
        ViewComponent().add(children: [
            DurationComponent()
        ])
    ])
}
