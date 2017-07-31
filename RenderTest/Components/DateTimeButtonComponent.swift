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
        return ComponentNode(ViewComponent(), in: self).add(children: [
            ComponentNode(ListRowComponent(), in: self).add(children: [
                ComponentNode(TextComponent(text: "Départ : Ven. 21 Jui. - 13h30"), in: self),
                ComponentNode(IconComponent(iconName: "arrow-right"), in: self)
            ])
        ])
    }
}
