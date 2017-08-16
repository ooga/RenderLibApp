//
//  ScreenComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 28/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class ScreenComponentStateful<S: StateType>: StylizedComponent<S> {
    override init(key: String, styles: Dictionary<String, Any> = [:]) {
        super.init(key: key, styles: styles)
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        return Node<UIScrollView>() { view, layout, size in
            layout.width = size.width
            layout.height = size.height - 64
            layout.marginTop = 64
            self.applyStyles(view: view, layout: layout)
        }
    }
}
