//
//  JourneySolutionsScreen.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render
import NavitiaSDK

struct JourneySolutionsScreenState: StateType {
    var journeys: Journeys? = nil
}

class JourneySolutionsScreen: ScreenComponentStateful<JourneySolutionsScreenState> {
    required init() {
        super.init(key: "JourneySolutionScreen", styles: [:])
        let config = NavitiaConfiguration(token: "<token>")
        let navitiaSDK = NavitiaSDK(configuration: config)
        
        // Building the NavitiaSDK request
        navitiaSDK.journeysApi.newJourneysRequestBuilder()
            .withFrom("stop_area:OIF:SA:59238") // Bastille (Paris)
            .withTo("stop_area:OIF:SA:59415") // Villiers (Paris)
            .get(completion: { journeys, error in
                if (error != nil) {
                    NSLog(error.debugDescription)
                } else {
                    // Journeys successfuly fetched, we store them in the screen state
                    // This will re-render the screen component (render method called)
                    self.setState { state in
                        state.journeys = journeys
                    }
                }
            })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        var journeyComponents: [NodeType] = []
        if (state.journeys != nil) {
            journeyComponents = self.getJourneyComponents(journeys: state.journeys!)
        }
        
        return ComponentNode(ScreenComponent(key: self.uniqueKey + "/screen"), in: self).add(children: [
            ComponentNode(ViewComponent(key: self.uniqueKey + "/screen/view"), in: self).add(children: [
                ComponentNode(ContainerComponent(key: self.uniqueKey + "/screen/view/container", styles: containerStyles), in: self).add(children: [
                    ComponentNode(JourneyFormComponent(key: self.uniqueKey + "/screen/view/container/journeyform"), in: self),
                    ComponentNode(DateTimeButtonComponent(key: self.uniqueKey + "/screen/view/container/datetimebutton"), in: self)
                ]),
                ComponentNode(ListViewComponent(key: self.uniqueKey + "/screen/view/list", styles: listStyles), in: self).add(children: journeyComponents)
            ])
        ])
    }
    
    func getJourneyComponents(journeys: Journeys) -> [NodeType] {
        var results: [NodeType] = []
        var index: Int = 0
        for journey in journeys.journeys! {
            results.append(ComponentNode(JourneySolutionComponent(journey: journey, key: self.uniqueKey + "/screen/view/list/journeysolution" + String(index)), in: self))
            index += 1
        }
        return results
    }
    
    let containerStyles = [
        "backgroundColor": config.colors.tertiary
    ]
    let listStyles = [
        "backgroundColor": config.colors.lighterGray
    ]
}
