//
//  PlaceComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 01/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class PlaceComponent: ViewComponent {
    var placeName: String? = nil
    var cityName: String? = nil
    
    required init(placeName: String?, cityName: String? = "", key: String = "", styles: Dictionary<String, Any> = [:]) {
        super.init(key: key, styles: styles)
        self.placeName = placeName
        self.cityName = cityName
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("PlaceComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: containerStyles, dict2: self.styles)
        return ComponentNode(ViewComponent(key: self.uniqueKey + "/view", styles: computedStyles), in: self).add(children: [
            ComponentNode(TextComponent(text: self.placeName! + ",", styles: nameStyles), in: self),
            ComponentNode(TextComponent(text: self.cityName!), in: self),
        ])
    }
    
    let containerStyles: [String: Any] = [
        "flexDirection": YGFlexDirection.row
    ]
    let nameStyles: [String: Any] = [
        "fontWeight": "bold",
        "marginEnd": config.metrics.marginS
    ]
}
