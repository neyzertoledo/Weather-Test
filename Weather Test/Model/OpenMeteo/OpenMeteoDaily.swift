//
//  OpenMeteoDaily.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct OpenMeteoDaily: Codable {
    let time: [String]
    let temperatureMax: [Double]
    let temperatureMin: [Double]
    let precipitationMax: [Int]
    let weatherCode: [Int]

    enum CodingKeys: String, CodingKey {
        case time
        case temperatureMax = "temperature2MMax"
        case temperatureMin = "temperature2MMin"
        case precipitationMax = "precipitationProbabilityMax"
        case weatherCode
    }
}
