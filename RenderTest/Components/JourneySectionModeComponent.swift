//
//  JourneySectionModeComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 27/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class JourneySectionModeComponent: ViewComponent {
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
        return ComponentNode(ViewComponent(), in: self).add(children: [
            ComponentNode(ModeComponent(name: "walk"), in: self),
            ComponentNode(ModeComponent(name: "train"), in: self),
            ComponentNode(ModeComponent(name: "walk"), in: self),
        ])
    }
}
