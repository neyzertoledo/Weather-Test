//
//  OpenMeteoCurrent.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct OpenMeteoCurrent: Codable {
    let time: String
    let interval: Int
    let temperature2M: Double
    let apparentTemperature: Double
    let precipitation: Int
    let windSpeed10M: Double
    let relativeHumidity2M: Int
    let isDay: Int
    let weatherCode: Int

    func toModel() throws -> CurrentForecast {
        CurrentForecast(
            time: try Parser.timeParser(for: self.time),
            temperature: self.temperature2M,
            feelsLike: self.apparentTemperature,
            windSpeed: windSpeed10M,
            precipitation: precipitation,
            humidity: relativeHumidity2M,
            isDay: self.isDay == 1,
            weatherIcon: Parser.weatherIcon(for: self.weatherCode),
            weatherDescription: Parser.weatherDescription(for: self.weatherCode)
        )
    }
}
