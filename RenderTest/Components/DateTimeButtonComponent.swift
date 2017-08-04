//
//  DateTimeButtonComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class DateTimeButtonComponent: ButtonComponent {
    required init(key: String, styles: Dictionary<String, Any> = [:]) {
        super.init(key: key, styles: styles)
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: listRowStyles, dict2: self.styles)
        return ComponentNode(ButtonComponent(styles: computedStyles), in: self).add(children: [
            ComponentNode(TextComponent(text: "Départ : Ven. 21 Jui. - 13h30", styles: textStyles), in: self),
            ComponentNode(ViewComponent(key: "", styles: viewStyles), in: self).add(children: [
                ComponentNode(IconComponent(name: "arrow-right", styles: iconStyles), in: self)
            ])
        ])
    }
    
    let listRowStyles: [String: Any] = [
        "paddingTop": config.metrics.marginL,
        "paddingLeft": 0,
        "paddingRight": 0,
        "paddingBottom": config.metrics.margin,
        "flexDirection": YGFlexDirection.row,
    ]
    let textStyles: [String: Any] = [
        "color": config.colors.white,
        "fontWeight": "bold",
    ]
    let viewStyles: [String: Any] = [
        "alignItems": YGAlign.flexEnd,
        "flexGrow": 1,
    ]
    let iconStyles: [String: Any] = [
        "color": config.colors.white,
        "fontSize": 16,
    ]
}
