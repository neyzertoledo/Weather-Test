//
//  CurrentForecast.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct CurrentForecast: Decodable {
    let time: Date
    let interval: Int
    let temperature: Double
    let feelsLike: Double
    let isDay: Bool
    let weatherIcon: String
    let weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case time
        case interval
        case temperature = "temperature2M"
        case feelsLike = "apparentTemperature"
        case isDay
        case weatherCode
    }

    init(
        time: Date,
        interval: Int = 900,
        temperature: Double,
        feelsLike: Double,
        isDay: Bool,
        weatherCode: Int
    ) {
        self.time = time
        self.interval = interval
        self.temperature = temperature
        self.feelsLike = feelsLike
        self.isDay = isDay
        self.weatherIcon = Parser.weatherIcon(for: weatherCode, isDay: isDay)
        self.weatherDescription = Parser.weatherDescription(for: weatherCode, isDay: isDay)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let timeString = try container.decode(String.self, forKey: .time)
        time = try Parser.timeParser(for: timeString)
        interval = try container.decode(Int.self, forKey: .interval)

        temperature = try container.decode(Double.self, forKey: .temperature)
        feelsLike = try container.decode(Double.self, forKey: .feelsLike)

        isDay = try container.decode(Int.self, forKey: .isDay) == 1

        let weatherCode = try container.decode(Int.self, forKey: .weatherCode)
        weatherIcon = Parser.weatherIcon(for: weatherCode, isDay: isDay )
        weatherDescription = Parser.weatherDescription(for: weatherCode, isDay: isDay)
    }
}
