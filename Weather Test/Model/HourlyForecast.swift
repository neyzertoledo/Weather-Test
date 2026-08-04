//
//  HourlyForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct HourlyForecast: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case time
        case temperature = "temperature_2m"
        case precipitation = "precipitation_probability_max"
        case weatherCode
    }

    let time: [Date]
    let temperature: [Float]
    let precipitation: [Int]
    let weatherCode: [Int]
}
