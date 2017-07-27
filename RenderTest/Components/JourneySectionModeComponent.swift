//
//  JourneySectionModeComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 27/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

func JourneySectionModeComponent() -> NodeType {
    return ViewComponent().add(children: [
        ModeComponent(name: "walk"),
        ModeComponent(name: "train"),
        ModeComponent(name: "walk"),
    ])
}
