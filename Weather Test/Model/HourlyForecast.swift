//
//  HourlyForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct HourlyForecast: Codable, Hashable {
    let time: [Date]
    let temperature_2: [Float]
    let precipitation_probability: [Int]
    let weather_code: [Int]
}
