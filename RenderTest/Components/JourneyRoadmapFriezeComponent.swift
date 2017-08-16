//
//  JourneyRoadmapFriezeComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render
import NavitiaSDK

class JourneyRoadmapFriezeComponent: ViewComponent {
    var sections: [Section] = []
    
    init(sections: [Section], key: String = "", styles: Dictionary<String, Any> = [:]) {
        super.init(key: key, styles: styles)
        self.sections = sections
    }
    
    required init() {
        super.init(key: "", styles: [:])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("JourneyRoadmapFriezeComponent::init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        let computedStyles = mergeDictionaries(dict1: containerStyles, dict2: self.styles)
        let sectionComponents = getSectionComponents(sections: self.sections)
        return ComponentNode(ViewComponent(key: "", styles: computedStyles), in: self).add(children: [
            ComponentNode(SeparatorComponent(), in: self),
            ComponentNode(ViewComponent(key: "", styles: modeListStyles), in: self).add(children: sectionComponents)
        ])
    }
    
    func getSectionComponents(sections: [Section]) -> [NodeType] {
        var results: [NodeType] = []
        for section in sections {
            if section.type! == "public_transport" || section.type! == "street_network" {
                let modeIcon: String = getModeIcon(section: section)
                var mainColor: UIColor? = nil
                var lineCode: String? = nil
                if section.displayInformations != nil {
                    mainColor = getUIColorFromHexadecimal(hex: (section.displayInformations?.color)!)
                    lineCode = section.displayInformations?.code
                }
                results.append(ComponentNode(JourneySectionAbstractComponent(modeIcon: modeIcon, duration: section.duration!, lineCode: lineCode, color: mainColor), in: self))
            }
        }
        return results
    }
    
    func getModeIcon(section: Section) -> String {
        switch section.type! {
            case "public_transport": return getCommercialMode(links: section.links!)
            case "transfer": return section.transferType!
            case "waiting": return section.type!
            default: return section.mode!
        }
    }
    
    func getCommercialMode(links: [LinkSchema]) -> String {
        let id = getCommercialModeId(links: links)
        var modeData = id.characters.split(separator: ":").map(String.init)
        return modeData[1]
    }
    
    func getCommercialModeId(links: [LinkSchema]) -> String {
        for link in links {
            if link.type == "commercial_mode" {
                return link.id!
            }
        }
        return "<not_found>"
    }
    
    let containerStyles: [String: Any] = [
        "flexDirection": YGFlexDirection.row,
    ]
    let modeListStyles: [String: Any] = [
        "paddingTop": config.metrics.marginL,
        "paddingBottom": config.metrics.marginL,
        "flexDirection": YGFlexDirection.row,
        "flexGrow": 1,
        "marginEnd": config.metrics.margin * -1
    ]
}
