//
//  OpenMeteo.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import Foundation

// TODO: CodingKeys to use camelCase instead of snake_case
struct OpenMeteoResponse: Codable {
    let timezone: String
    let generationtime_ms: Double
    let utc_offset_seconds: Int
    let current: CurrentForecast
    let hourly: HourlyForecast
    let daily: DailyForecast
}
