//
//  DailyForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct DailyForecast: Decodable, Hashable {
    let time: [String]
    let temperatureMax: [Double]
    let temperatureMin: [Double]
    let precipitationMax: [Int]
    let weatherIcon: [String]

    enum CodingKeys: String, CodingKey {
        case time
        case temperatureMax = "temperature2MMax"
        case temperatureMin = "temperature2MMin"
        case precipitationMax = "precipitationProbabilityMax"
        case weatherCode
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        time = try container.decode([String].self, forKey: .time)
        temperatureMax = try container.decode([Double].self, forKey: .temperatureMax)
        temperatureMin = try container.decode([Double].self, forKey: .temperatureMin)
        precipitationMax = try container.decode([Int].self, forKey: .precipitationMax)

        let weatherCodes = try container.decode([Int].self, forKey: .weatherCode)
        weatherIcon = Parser.weatherIcon(for: weatherCodes)
    }
}
