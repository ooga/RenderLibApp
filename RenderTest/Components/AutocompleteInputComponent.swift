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
        return ComponentNode(ButtonComponent(), in: self).add(children: [
            ComponentNode(ContainerComponent(), in: self).add(children: [
                ComponentNode(IconComponent(iconName: self.icon), in: self),
                ComponentNode(ViewComponent(), in: self).add(children: [
                    ComponentNode(TextComponent(text: self.placeholder), in: self)
                ])
            ])
        ])
    }
}
