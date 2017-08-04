//
//  EmptyStateType.swift
//  RenderTest
//
//  Created by Thomas Noury on 04/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

// State type
struct EmptyStateType: StateType {
    var _dummy: Bool = true
}

// Primitives
typealias ButtonComponent = ButtonComponentStateful<EmptyStateType>
typealias LabelComponent = LabelComponentStateful<EmptyStateType>
typealias ViewComponent = ViewComponentStateful<EmptyStateType>

// Screens
typealias ScreenComponent = ScreenComponentStateful<EmptyStateType>
