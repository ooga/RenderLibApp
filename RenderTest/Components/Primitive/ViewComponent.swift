//
//  ViewComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 27/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class ViewComponentStateful<S: StateType>: StylizedComponent<S> {
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
