//
//  DateTimeButtonComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

func DateTimeButtonComponent() -> NodeType {
    return ViewComponent().add(children: [
        ListRowComponent().add(children: [
            TextComponent(text: "Départ : Ven. 21 Jui. - 13h30"),
            IconComponent(iconName: "arrow-right")
        ])
    ])
}
