//
//  CurrentForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct CurrentForecast: Codable {
    enum CodingKeys: String, CodingKey {
        case time = "dt"
        case interval
        case temperature = "temperature_2m"
        case feelsLike = "apparent_temperature"
        case isDay
        case weatherCode
    }

    let time: Date
    let interval: Int
    let temperature: Float
    let feelsLike: Float
    let isDay: Bool
    let weatherCode: Int
}
