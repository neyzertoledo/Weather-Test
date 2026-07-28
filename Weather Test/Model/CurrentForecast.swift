//
//  CurrentForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct CurrentForecast: Codable {
    let time: Date
    let interval: Int
    let temperature_2: Float
    let aparent_temperature: Float
    let is_day: Bool
    let weather_code: Int
}
