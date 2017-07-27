//
//  AutocompleteInputComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

func AutocompleteInputComponent(icon: String, iconColor: UIColor, title: String, placeholder: String) -> NodeType {
    return ButtonComponent().add(children: [
        ContainerComponent().add(children: [
            IconComponent(iconName: icon),
            ViewComponent().add(children: [
                TextComponent(text: "Loading..."),
                TextComponent(text: placeholder)
            ])
        ])
    ])
}
