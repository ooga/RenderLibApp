//
//  FormComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class FormComponent: ViewComponent {
    required override init(key: String, styles: Dictionary<String, Any> = [:]) {
        super.init(key: key, styles: styles)
    }
    
    required init() {
        super.init(key: "<empty!>", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("FormComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: formStyles, dict2: self.styles)
        return ComponentNode(ViewComponent(key: "", styles: computedStyles), in: self)
    }
    
    let formStyles: [String: Any] = [
        "backgroundColor": config.colors.white,
        "borderRadius": config.metrics.radius,
    ]
}
