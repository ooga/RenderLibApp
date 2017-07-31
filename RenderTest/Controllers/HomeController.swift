//
//  HomeController.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//
import Render
import UIKit

class ScrollExampleComponentView: StatelessComponentView {
    override func render() -> NodeType {
        return Node<UIScrollView> { view, layout, size in
            layout.width = size.width
            layout.height = size.height
            }.add(children: Array(0..<16).map {
                ComponentNode(JourneySolutionComponent(), in: self, key: "\($0)")
            })
    }
}

class HomeController: ViewController, ComponentController {
    
    // Our root component.
    var component = ScrollExampleComponentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Adds the component to the view hierarchy.
        addComponentToViewControllerHierarchy()
    }
    
    // Whenever the view controller changes bounds we want to re-render the component.
    override func viewDidLayoutSubviews() {
        renderComponent()
    }
    
    func configureComponentProps() {
        // No props to configure
    }
    
}

/*
class ScrollExampleComponentView: StatelessComponentView {
    override func render() -> NodeType {
        return Node<UIScrollView> { scrollView, layout, size in
            layout.width = size.width
            layout.height = 200
            scrollView.backgroundColor = UIColor.cyan
        }.add(children: [
            Node<UIView>().add(children: [
                Node<UIView>().add(children: Array(0..<160).map {_ in
                    Node<UILabel>() { view, layout, size in
                        layout.width = size.width
                        layout.height = 32
                        view.text = "test"
                    }
                })
            ])
        ])
    }
}

class HomeController: ViewController, ComponentController {
    var component = ScrollExampleComponentView()
    
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
*/
