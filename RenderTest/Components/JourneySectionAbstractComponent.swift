//
//  File.swift
//  RenderTest
//
//  Created by Thomas Noury on 02/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Render

class JourneySectionAbstractComponent: ViewComponent {
    var mode: String = "<unknown>"
    var duration: Int = 0
    var lineCode: String = "<code>"
    var color: UIColor = UIColor()
    
    init(mode: String, duration: Int, lineCode: String = "", color: UIColor = UIColor(), key: String = "", styles: Dictionary<String, Any> = [:]) {
        self.mode = mode
        self.duration = duration
        self.lineCode = lineCode
        self.color = color
        
        super.init(key: key, styles: styles)
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("JourneySectionAstractComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let containerStyles: [String: Any] = [
            "fontSize": 16,
            "flexGrow": self.duration,
            "marginEnd": config.metrics.margin,
        ]
        let computedStyles = mergeDictionaries(dict1: containerStyles, dict2: self.styles)
        return ComponentNode(ViewComponent(key: self.uniqueKey + "/view", styles: computedStyles), in: self).add(children: [
            ComponentNode(ViewComponent(key: self.uniqueKey + "/view/view", styles: viewStyles), in: self).add(children: [
                ComponentNode(ModeComponent(name: self.mode, key: self.uniqueKey + "/view/view/mode", styles: modeStyles), in: self),
                ComponentNode(LineCodeComponent(code: self.lineCode, color: self.color, key: self.uniqueKey + "/view/view/linecode"), in: self),
            ]),
            ComponentNode(JourneySectionSegmentComponent(color: self.color, key: self.uniqueKey + "/view/journeysectionsegment"), in: self),
        ])
    }
    let viewStyles: [String: Any] = [
        "flexDirection": YGFlexDirection.row,
        "marginBottom": 12,
    ]
    let modeStyles = [
        "marginRight": config.metrics.marginS,
    ]
}
