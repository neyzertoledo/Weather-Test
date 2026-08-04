//
//  CurrentForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct CurrentForecast: Codable {
    enum CodingKeys: String, CodingKey {
        case time
        case interval
        case temperature = "temperature2M"
        case feelsLike = "apparentTemperature"
        case isDay
        case weatherCode
    }

    let time: String
    let interval: Int
    let temperature: Double
    let feelsLike: Double
    let isDay: Int
    let weatherCode: Int
}
