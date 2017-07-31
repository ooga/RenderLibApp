//
//  LabelComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 27/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class LabelComponent: StylizedComponent {
    var text: String = ""
    
    init(text: String = "", styles: Dictionary<String, Any> = [:]) {
        self.text = text
        super.init(styles: styles)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func render() -> NodeType {
        return Node<UILabel>() { view, layout, _ in
            view.text = self.text
            self.applyLabelStyles(view: view, layout: layout)
        }
    }
    
    func applyLabelStyles(view: UILabel, layout: YGLayout) {
        super.applyStyles(view: view, layout: layout)
        for (prop, value) in styles {
            switch prop {
            case "color": view.textColor = value as! UIColor; break
            case "fontWeight": view.font = UIFont.boldSystemFont(ofSize: 500)
            default: break
            }
        }
    }
}
