//
//  HourlyForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct HourlyForecast: Decodable, Hashable {
    let time: [Date]
    let temperature: [Double]
    let precipitation: [Int]
    let weatherIcon: [String]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature = "temperature2M"
        case precipitation = "precipitationProbability"
        case weatherCode
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let timeList = try container.decode([String].self, forKey: .time)
        time = try Parser.timeParser(for: timeList)
        temperature = try container.decode([Double].self, forKey: .temperature)
        precipitation = try container.decode([Int].self, forKey: .precipitation)

        let weatherCodes = try container.decode([Int].self, forKey: .weatherCode)
        weatherIcon = Parser.weatherIcon(for: weatherCodes)
    }
}
