//
//  JourneyFormComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render
import NavitiaSDK

class JourneyFormComponent: ViewComponent {
    var origin: Place? = nil
    var destination: Place? = nil
    
    required init(origin: Place?, destination: Place?, key: String = "", styles: Dictionary<String, Any> = [:]) {
        super.init(key: key, styles: styles)
        self.origin = origin
        self.destination = destination
    }
    
    required init() {
        super.init(key: "<empty!>", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = self.styles
        return ComponentNode(FormComponent(key: "", styles: computedStyles), in: self).add(children: [
            ComponentNode(AutocompleteInputComponent(icon: "origin", iconColor: config.colors.origin, placeName: (origin?.name)!, cityName: "", placeholder: "Saisissez votre point de départ"), in: self),
            ComponentNode(SeparatorComponent(), in: self),
            ComponentNode(AutocompleteInputComponent(icon: "destination", iconColor: config.colors.destination, placeName: (destination?.name)!, cityName: "", placeholder: "Saisissez votre point d'arrivée"), in: self)
        ])
    }
}
