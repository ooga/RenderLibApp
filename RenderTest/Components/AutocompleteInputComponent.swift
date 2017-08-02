//
//  AutocompleteInputComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class AutocompleteInputComponent: ButtonComponent {
    var icon: String = ""
    var iconColor: UIColor? = nil
    var title: String = ""
    var placeholder: String = ""
    
    init(icon: String = "", iconColor: UIColor = UIColor(), title: String = "", placeholder: String = "", styles: Dictionary<String, Any> = [:]) {
        self.icon = icon
        self.iconColor = iconColor
        self.title = title
        self.placeholder = placeholder
        
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let iconColorStyles:[String: Any] = ["color": self.iconColor as Any]
        let iconComputedStyles = mergeDictionaries(dict1: iconColorStyles, dict2: iconStyles)
        let computedStyles = self.styles
        return ComponentNode(ButtonComponent(styles: computedStyles), in: self).add(children: [ // TouchableOpacity
            ComponentNode(ViewComponent(styles: rowStyles), in: self).add(children: [ // View row
                ComponentNode(ViewComponent(styles: containerStyles), in: self).add(children: [ // View editable container left
                    ComponentNode(IconComponent(name: self.icon, styles: iconComputedStyles), in: self), // Icon icon
                    ComponentNode(ViewComponent(styles: descriptionStyles), in: self).add(children: [ // View description
                        //ComponentNode(TextComponent(text: self.placeholder, styles: placeholderStyles), in: self) // Text placeholder
                        ComponentNode(PlaceComponent(), in: self)
                    ])
                ])
            ])
        ])
    }
    
    let rowStyles: [String: Any] = [
        "flexDirection": YGFlexDirection.row,
    ]
    let containerStyles: [String: Any] = [
        "padding": config.metrics.marginL,
        "flexDirection": YGFlexDirection.row,
        "alignItems": YGAlign.center,
        "paddingRight": 8,
    ]
    let iconStyles: [String: Any] = [
        "width": 32,
        "fontSize": 26,
    ]
    let descriptionStyles: [String: Any] = [:
    ]
    let titleStyles: [String: Any] = [
        "fontWeight": "bold",
        "color": config.colors.darkGray
    ]
    let placeholderStyles: [String: Any] = [
        "color": config.colors.gray,
        "fontSize": 14,
    ]
}
