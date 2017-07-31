//
//  ModeComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 27/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class ModeComponent: ViewComponent {
    var name: String = ""
    
    init(name: String = "", styles: Dictionary<String, Any> = [:]) {
        self.name = name
        super.init(styles: styles)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        return ComponentNode(IconComponent(iconName: name), in: self)
    }
}
