//
//  DailyForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 05/08/26.
//

import Foundation

struct DailyForecast: Hashable {
    let time: Date
    let temperatureMax: Double
    let temperatureMin: Double
    let precipitationMax: Int
    let weatherIcon: WeatherIcons
}
