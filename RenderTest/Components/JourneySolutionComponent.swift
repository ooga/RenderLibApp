//
//  JourneySolutionComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class JourneySolutionComponent: ViewComponent {
    override init(styles: Dictionary<String, Any>) {
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: listStyles, dict2: self.styles)
        return ComponentNode(ListRowComponent(styles: computedStyles), in: self).add(children: [
            ComponentNode(JourneySolutionRowComponent(), in: self)
        ])
    }
    
    let listStyles:[String: Any] = [
        "backgroundColor": config.colors.white,
        "padding": config.metrics.marginL,
        "borderRadius": config.metrics.radius,
        "marginBottom": config.metrics.margin,
    ]
}
