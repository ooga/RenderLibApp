//
//  ScreenComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 28/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class ScreenComponent: StylizedComponent {
    override init(styles: Dictionary<String, Any>) {
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        return Node<UIScrollView>() { view, layout, size in
            layout.width = size.width
            layout.height = size.height - 24
            layout.marginTop = 24
            self.applyStyles(view: view, layout: layout)
        }
    }
}
