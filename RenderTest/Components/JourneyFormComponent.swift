//
//  JourneyFormComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

func JourneyFormComponent() -> NodeType {
    return ViewComponent().add(children: [
        FormComponent().add(children: [
            AutocompleteInputComponent(icon: "origin", iconColor: UIColor.green, title: "Départ", placeholder: "Saisissez votre point de départ"),
            SeparatorComponent(),
            AutocompleteInputComponent(icon: "destination", iconColor: UIColor.magenta, title: "Arrivée", placeholder: "Saisissez votre point d'arrivée")
        ])
    ])
}
