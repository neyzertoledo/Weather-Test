//
//  CurrentForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 05/08/26.
//

import Foundation

struct CurrentForecast {
    let time: Date
    let temperature: Double
    let feelsLike: Double
    let isDay: Bool
    let weatherIcon: WeatherIcons
    let weatherDescription: String
}
