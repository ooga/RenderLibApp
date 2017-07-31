//
//  ButtonComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 27/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class ButtonComponent: StylizedComponent {
    var text: String = ""
    
    init(text: String = "", styles: Dictionary<String, Any> = [:]) {
        self.text = text
        
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        return Node<UIButton>() { view, layout, _ in
            self.applyStyles(view: view, layout: layout)
        }
    }
}
