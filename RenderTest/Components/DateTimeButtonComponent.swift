//
//  DateTimeButtonComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class DateTimeButtonComponent: ViewComponent {
    required override init(styles: Dictionary<String, Any>) {
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: listRowStyles, dict2: self.styles)
        return ComponentNode(ListRowComponent(styles: computedStyles), in: self).add(children: [
            ComponentNode(TextComponent(text: "Départ : Ven. 21 Jui. - 13h30", styles: textStyles), in: self),
            ComponentNode(ViewComponent(styles: viewStyles), in: self).add(children: [
                ComponentNode(IconComponent(name: "arrow-right", styles: iconStyles), in: self)
            ])
        ])
    }
    
    let listRowStyles: [String: Any] = [
        "paddingTop": config.metrics.margin,
        "paddingRight": 0,
        "paddingBottom": 0,
    ]
    let textStyles: [String: Any] = [
        "color": config.colors.white,
        "fontWeight": "bold",
    ]
    let viewStyles: [String: Any] = [
        "alignItems": YGAlign.flexEnd,
    ]
    let iconStyles: [String: Any] = [
        "color": config.colors.white,
        "marginBottom": config.metrics.margin,
    ]
}
