//
//  IconComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

func IconComponent(iconName: String) -> NodeType {
    return LabelComponent(text: "icon<" + iconName + ">")
}
