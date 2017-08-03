//
//  LineCodeComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 02/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Render

class LineCodeComponent: ViewComponent {
    var code: String = ""
    var color: UIColor = UIColor()
    
    init(code: String, color: UIColor, styles: Dictionary<String, Any> = [:]) {
        self.code = code
        self.color = color
        super.init(styles: styles)
    }
    
    required init() {
        fatalError("LineCodeComponent::init() has not been implemented. You must specify 'code' and 'color' parameters in constructor")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LineCodeComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let codeStyles:[String: Any] = [
            "backgroundColor": self.color,
            "borderRadius": 3,
            "padding": 6,
        ]
        let textStyles: [String: Any] = [
            "color": config.colors.white,
            "fontSize": 12,
            "fontWeight": "bold",
        ]
        let computedStyles = mergeDictionaries(dict1: codeStyles, dict2: self.styles)
        return ComponentNode(ViewComponent(styles: computedStyles), in: self).add(children: [
            ComponentNode(TextComponent(text: code, styles: textStyles), in: self)
        ])
    }
    
    
}
