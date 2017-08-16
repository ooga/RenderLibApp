//
//  YelpController.swift
//  RenderTest
//
//  Created by Johan Rouve on 11/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import UIKit

class YelpController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let destination = segue.destination as? JourneySolutionsController {
            destination.setProps(originId: "2.3665844;48.8465337", destinationId: "2.2979169;48.8848719")
        }
    }
}
