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
    var origin: Place? = nil
    var destination: Place? = nil
    var journeys: Journeys? = nil
}

class JourneySolutionsScreen: ScreenComponentStateful<JourneySolutionsScreenState> {
    var navitiaConfig: NavitiaConfiguration? = nil
    var navitiaSDK: NavitiaSDK? = nil
    
    required init() {
        super.init(key: "JourneySolutionScreen", styles: [:])
        
        self.navitiaConfig = NavitiaConfiguration(token: "0de19ce5-e0eb-4524-a074-bda3c6894c19")
        self.navitiaSDK = NavitiaSDK(configuration: self.navitiaConfig!)
        
        self.setOrigin(q: "Bastille Paris")
        self.setDestination(q: "Villiers")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() -> NodeType {
        var journeyFormComponent: NodeType = ComponentNode(ViewComponent(), in: self)
        if state.origin != nil && state.destination != nil {
            journeyFormComponent = ComponentNode(JourneyFormComponent(origin: state.origin, destination: state.destination, key: self.uniqueKey + "/screen/view/container/journeyform"), in: self)
            NSLog((state.origin?.id)!)
            NSLog((state.destination?.id)!)
            self.retrieveJourneys(originId: (state.origin?.id)!, destinationId: (state.destination?.id)!)
        }
        
        var journeyComponents: [NodeType] = []
        if state.journeys != nil {
            journeyComponents = self.getJourneyComponents(journeys: state.journeys!)
        }
        
        return ComponentNode(ScreenComponent(key: self.uniqueKey + "/screen"), in: self).add(children: [
            ComponentNode(ViewComponent(key: self.uniqueKey + "/screen/view"), in: self).add(children: [
                ComponentNode(ContainerComponent(key: self.uniqueKey + "/screen/view/container", styles: containerStyles), in: self).add(children: [
                    journeyFormComponent,
                    ComponentNode(DateTimeButtonComponent(key: self.uniqueKey + "/screen/view/container/datetimebutton"), in: self)
                ]),
                ComponentNode(ListViewComponent(key: self.uniqueKey + "/screen/view/list", styles: listStyles), in: self).add(children: journeyComponents)
            ])
        ])
    }
    
    func setOrigin(q: String) {
        self.navitiaSDK?.placesApi.newPlacesRequestBuilder().withQ(q).withType(["address"]).get(completion: { places, error in
            if error != nil {
                NSLog(error.debugDescription)
            } else {
                self.setState { state in
                    state.origin = places?.places?[0]
                }
            }
        })
    }
    
    func setDestination(q: String) {
        self.navitiaSDK?.placesApi.newPlacesRequestBuilder().withQ(q).withType(["address"]).get(completion: { places, error in
            if error != nil {
                NSLog(error.debugDescription)
            } else {
                self.setState { state in
                    state.destination = places?.places?[0]
                }
            }
        })
    }
    
    func retrieveJourneys(originId: String, destinationId: String) {
        navitiaSDK?.journeysApi.newJourneysRequestBuilder()
            .withFrom(originId)
            .withTo(destinationId)
            .get(completion: { journeys, error in
                if error != nil {
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
    
    func getJourneyComponents(journeys: Journeys) -> [NodeType] {
        var results: [NodeType] = []
        var index: Int32 = 0
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
