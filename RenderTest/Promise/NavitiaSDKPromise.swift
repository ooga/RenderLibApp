//
//  NavitiaSDKPromise.swift
//  RenderTest
//
//  Created by Johan Rouve on 09/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import NavitiaSDK
import then

extension PlacesRequestBuilder {
    open func get() -> Promise<Places> {
        return Promise { resolve, reject in
            self.get(completion: { places, error in
                if error != nil {
                    reject(error!)
                } else {
                    resolve(places!)
                }
            })
        }
    }
}
