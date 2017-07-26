//
//  Box.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class BoxComponent: StatelessComponentView {
    var text: String = ""
    
    override func render() -> NodeType {
        let label = Node<UILabel> { view, _, _ in
            view.text = self.text
        }
        
        return Node<UIView>(reuseIdentifier: "Box").add(child: label)
    }
}
