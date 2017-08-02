//
//  JourneySolutionsScreen.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class JourneySolutionsScreen: ScreenComponent {
    override func render() -> NodeType {
        return ComponentNode(ScreenComponent(), in: self).add(children: [
            ComponentNode(ViewComponent(styles: viewStyles), in: self).add(children: [
                ComponentNode(ContainerComponent(styles: containerStyles), in: self).add(children: [
                    ComponentNode(JourneyFormComponent(), in: self),
                    ComponentNode(DateTimeButtonComponent(), in: self)
                ]),
                ComponentNode(ListViewComponent(styles: listStyles), in: self).add(children: [
                    ComponentNode(JourneySolutionComponent(), in: self),
                    ComponentNode(JourneySolutionComponent(), in: self),
                    ComponentNode(JourneySolutionComponent(), in: self),
                ])
            ])
        ])
    }
    
    let viewStyles = [
        "backgroundColor": UIColor.red
    ]
    let containerStyles = [
        "backgroundColor": config.colors.tertiary
    ]
    let listStyles = [
        "backgroundColor": config.colors.lighterGray
    ]
}
