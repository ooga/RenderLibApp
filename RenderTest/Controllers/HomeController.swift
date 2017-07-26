//
//  HomeController.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Render

class HomeController: ViewController, ComponentController {
    var component = HomeScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponentToViewControllerHierarchy()
    }
    
    override func viewDidLayoutSubviews() {
        renderComponent()
    }
    
    func configureComponentProps() {
        // no props
    }
}
