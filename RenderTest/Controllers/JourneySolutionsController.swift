//
//  JourneySolutionsController.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//
import Render
import UIKit
import NavitiaSDK

class JourneySolutionsController: ViewController, ComponentController {
    var originId: String?
    var origin: String?
    var destinationId: String?
    var destination: String?
    
    var component = JourneySolutionsScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("controller.JourneySolutionsController.title", comment: "Navigation bar title for journey solutions screen")
        addComponentToViewControllerHierarchy()
    }
    
    override func viewDidLayoutSubviews() {
        renderComponent()
    }
    
    func configureComponentProps() {}
    
    func setProps(originId: String, destinationId: String, origin: String? = nil, destination: String? = nil) {
        component.state.originId = originId
        component.state.destinationId = destinationId
        
        if (origin != nil) {
            component.state.origin = origin!
        }
        if (destination != nil) {
            component.state.destination = destination!
        }
    }
    
    func setProps(origin: Place, destination: Place) {
        self.setProps(originId: origin.id!, destinationId: destination.id!, origin: origin.name, destination: destination.name)
    }
}

