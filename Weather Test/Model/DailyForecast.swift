//
//  DailyForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct DailyForecast: Codable, Hashable {
    let time: [Date]
    let temperature_2_max: [Float]
    let temperature_2_min: [Float]
    let precipitation_probability_max: [Int]
    let weather_code: [Int]
}
