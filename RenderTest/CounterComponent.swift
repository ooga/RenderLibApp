//
//  PaddedComponent.swift
//  
//
//  Created by Thomas Noury on 26/07/2017.
//
//

import Foundation
import Render

struct CounterState: StateType {
    let count: Int = 0
}

class CounterComponent: ComponentView<CounterState> {
    override func render() -> NodeType {
        let circle = Node<UIView> { view, layout, size in
            view.backgroundColor = UIColor.green
        }
        let text = Node<UILabel> { view, layout, size in
            view.text = "test"
        }
        let container = Node<UIView> { view, layout, _ in
            view.backgroundColor = UIColor.cyan
        }
        return container.add(children: [circle, text])
    }
}
