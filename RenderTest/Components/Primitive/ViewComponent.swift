//
//  ViewComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 27/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

func ViewComponent() -> NodeType {
    return ViewComponent(styles: [:]) 
}

func ViewComponent(styles: Dictionary<String, Dictionary<String, Any>>) -> NodeType {
    return Node<UIView>(reuseIdentifier: "View") { view, layout, size in
        for (key, props) in styles {
            if key == "view" {
                for (prop, value) in props {
                    switch prop {
                        case "alpha": view.alpha = CGFloat((value as? Int)!); break
                        case "backgroundColor": view.backgroundColor = value as? UIColor; break
                        case "cornerRadius": view.cornerRadius = CGFloat((value as? Int)!); break
                        default: break
                    }
                }
            } else if key == "layout" {
                
            }
        }
    }
}
