//
//  DailyForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct DailyForecast: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case time
        case temperatureMax = "temperature_2m_max"
        case temperatureMin = "temperature_2m_min"
        case precipitationMax = "precipitation_probability_max"
        case weatherCode
    }

    let time: [Date]
    let temperatureMax: [Float]
    let temperatureMin: [Float]
    let precipitationMax: [Int]
    let weatherCode: [Int]
}
