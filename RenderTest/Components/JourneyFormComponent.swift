//
//  JourneyFormComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class JourneyFormComponent: ViewComponent {
    required override init(styles: Dictionary<String, Any>) {
        super.init(styles: styles)
    }
    
    required init() {
        super.init(styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = self.styles
        return ComponentNode(FormComponent(styles: computedStyles), in: self).add(children: [
            ComponentNode(AutocompleteInputComponent(icon: "origin", iconColor: config.colors.origin, title: "Départ", placeholder: "Saisissez votre point de départ"), in: self),
            ComponentNode(SeparatorComponent(), in: self),
            ComponentNode(AutocompleteInputComponent(icon: "destination", iconColor: config.colors.destination, title: "Arrivée", placeholder: "Saisissez votre point d'arrivée"), in: self)
        ])
    }
}
