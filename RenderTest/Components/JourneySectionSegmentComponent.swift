//
//  JourneySectionSegmentComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 02/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Render

class JourneySectionSegmentComponent: ViewComponent {
    var color: UIColor = UIColor()
    
    init(color: UIColor, key: String = "", styles: Dictionary<String, Any> = [:]) {
        self.color = color
        super.init(key: key, styles: styles)
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let containerStyles: [String: Any] = [
            "backgroundColor": self.color,
            "borderRadius": 3,
            "height": 5,
        ]
        let computedStyles = mergeDictionaries(dict1: containerStyles, dict2: self.styles)
        return ComponentNode(ViewComponent(key: "", styles: computedStyles), in: self)
    }
}
