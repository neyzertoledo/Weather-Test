//
//  HourlyForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 05/08/26.
//

import Foundation

struct HourlyForecast: Hashable {
    let time: Date
    let temperature: Double
    let precipitation: Int
    let weatherIcon: String
}
