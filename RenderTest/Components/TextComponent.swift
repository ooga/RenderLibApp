//
//  TextComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class TextComponent: LabelComponent {
    override init(text: String = "", styles: Dictionary<String, Any> = [:]) {
        super.init(text: text, styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: textStyles, dict2: self.styles)
        return ComponentNode(LabelComponent(text: text, styles: computedStyles), in: self)
    }
    
    let textStyles: [String: Any] = [
        "color": config.colors.primary,
    ]
}
