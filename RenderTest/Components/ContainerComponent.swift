//
//  ContainerComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class ContainerComponent: ViewComponent {
    var containerSize: String = ""
    
    init(containerSize: String = "standard", styles: Dictionary<String, Any> = [:]) {
        self.containerSize = containerSize
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: smallStyles, dict2: self.styles)
        return ComponentNode(ViewComponent(styles: computedStyles), in: self)
    }
    
    let smallStyles = [
        "padding": 10,
    ]
    let standardStyles = [
        "padding": 20,
    ]
}
