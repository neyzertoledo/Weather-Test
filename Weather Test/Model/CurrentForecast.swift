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
    let windSpeed: Double
    let precipitation: Int
    let humidity: Int
    let isDay: Bool
    let weatherIcon: WeatherIcons
    let weatherDescription: String

    static func mock() -> CurrentForecast {
        CurrentForecast(time: Date(), temperature: 20, feelsLike: 18, windSpeed: 10, precipitation: 0, humidity: 50, isDay: true, weatherIcon: .cloudDay, weatherDescription: "Cloudy")
    }
}
