//
//  HomeScreen.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

struct HomeScreenState: StateType {
    
}

class HomeScreen: ComponentView<HomeScreenState> {
    override func render() -> NodeType {
        return Node<UIView>{ view, layout, size in
            view.backgroundColor = UIColor.lightGray
        }.add(children: [
            ComponentNode(Box(), in: self) { component, _ in
                component.text = "tutu"
            },
            ComponentNode(Box(), in: self) { component, _ in
                component.text = "hehe"
            }
        ])
    }
}
