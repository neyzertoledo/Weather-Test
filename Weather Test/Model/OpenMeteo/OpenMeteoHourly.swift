//
//  OpenMeteoHourly.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct OpenMeteoHourly: Codable {
    let time: [String]
    let temperature: [Double]
    let precipitation: [Int]
    let weatherCode: [Int]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature = "temperature2M"
        case precipitation = "precipitationProbability"
        case weatherCode
    }
}
