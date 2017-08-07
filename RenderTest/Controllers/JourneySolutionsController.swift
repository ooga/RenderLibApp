//
//  JourneySolutionsController.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//
import Render
import UIKit

class JourneySolutionsController: ViewController, ComponentController {
    var component = JourneySolutionsScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponentToViewControllerHierarchy()
    }
    
    override func viewDidLayoutSubviews() {
        renderComponent()
    }
    
    func configureComponentProps() {
        // No props to configure
    }
}

