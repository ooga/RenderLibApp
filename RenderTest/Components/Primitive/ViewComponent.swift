//
//  ViewComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 27/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class ViewComponent: StylizedComponent {
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
        return Node<UIView>() { view, layout, size in
            self.applyStyles(view: view, layout: layout)
            for (prop, value) in self.styles {
                switch prop {
                case "borderColor": view.layer.borderColor = (value as! CGColor); break
                default: break
                }
            }
        }
    }
}
