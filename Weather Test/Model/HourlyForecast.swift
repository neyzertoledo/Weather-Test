//
//  HourlyForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import Foundation

struct HourlyForecast: Codable, Hashable {
    let temperature: Double
    let icon: String
    let time: String
}
