//
//  Forecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 05/08/26.
//

import Foundation

struct Forecast {
    let current: CurrentForecast
    let hourly: [HourlyForecast]
    let daily: [DailyForecast]
}
