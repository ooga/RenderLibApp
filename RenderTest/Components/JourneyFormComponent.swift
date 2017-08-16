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
    var origin: String = ""
    var destination: String = ""
    
    required init(origin: String, destination: String, key: String = "", styles: Dictionary<String, Any> = [:]) {
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
            ComponentNode(AutocompleteInputComponent(icon: "origin", iconColor: config.colors.origin, placeName: origin, placeholder: "Saisissez votre point de départ"), in: self),
            ComponentNode(SeparatorComponent(), in: self),
            ComponentNode(AutocompleteInputComponent(icon: "destination", iconColor: config.colors.destination, placeName: destination, placeholder: "Saisissez votre point d'arrivée"), in: self)
        ])
    }
}
