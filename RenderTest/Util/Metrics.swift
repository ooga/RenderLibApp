//
//  Metrics.swift
//  RenderTest
//
//  Created by Thomas Noury on 02/08/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation

func timeText(isoString: String) -> String {
    /*
    let date: Date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    let formatter: DateFormatter = DateFormatter()
    formatter.dateFormat = config.metrics.timeFormat
    return formatter.string(from: date)
    */
    return "<time>"
}

func durationText(minutes: Int) -> String {
    if (minutes < 60) {
        return String(minutes) + " min"
    } else {
        let hours = minutes / 60
        let remainingMinutes = minutes
        return String(hours) + " h " + String(remainingMinutes)
    }
}

func distanceText(meters: Int) -> String {
    if (meters < 1000) {
        return String(meters) + "m"
    } else {
        return String(meters / 1000) + " km"
    }
}
