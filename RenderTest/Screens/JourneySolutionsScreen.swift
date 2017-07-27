//
//  JourneySolutionsScreen.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class JourneySolutionScreen: StatelessComponentView {
    override func render() -> NodeType {        
        return ViewComponent().add(children: [
            ContainerComponent(containerSize: "small").add(children: [
                JourneyFormComponent(),
                DateTimeButtonComponent()
            ]),
            ListViewComponent().add(children: [
                JourneySolutionComponent(),
                JourneySolutionComponent(),
                JourneySolutionComponent()
            ])
        ])
    }
}
