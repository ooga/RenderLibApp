//
//  LabelComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 27/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

func LabelComponent(text: String) -> NodeType {
    return Node<UILabel>() { view, _, _ in
        view.text = text
    }
}
