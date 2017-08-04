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
    var name: String = ""
    
    init(name: String = "", key: String = "", styles: Dictionary<String, Any> = [:]) {
        self.name = name
        
        super.init(key: key, styles: styles)
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("IconComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: iconStyles, dict2: self.styles)
        return ComponentNode(LabelComponent(text: String.fontString(name: self.name), key: "", styles: computedStyles), in: self)
    }
    
    let iconStyles: [String: Any] = [
        "fontFamily": "SDKIcons",
        "fontSize": 24,
    ]
}
