//
//  IconComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class IconComponent: LabelComponent {
    var iconName: String = ""
    
    init(iconName: String = "", styles: Dictionary<String, Any> = [:]) {
        self.iconName = iconName
        
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        return ComponentNode(LabelComponent(text: "icon<" + iconName + ">"), in: self)
    }
}