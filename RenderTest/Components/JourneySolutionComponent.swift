//
//  JourneySolutionComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

func JourneySolutionComponent() -> NodeType {
    return ListRowComponent().add(children: [
        JourneySolutionRowComponent()
    ])
}
