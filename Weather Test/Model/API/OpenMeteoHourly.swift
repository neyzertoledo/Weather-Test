//
//  OpenMeteoHourly.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct OpenMeteoHourly: Codable {
    let time: [String]
    let temperature2M: [Double]
    let precipitationProbability: [Int]
    let weatherCode: [Int]

    func toModel() throws -> [HourlyForecast] {
        var hourlyForecast: [HourlyForecast] = []

        for index in 1..<time.count {
            hourlyForecast.append(
                HourlyForecast(
                    time: try Parser.timeParser(for: time[index]),
                    temperature: temperature2M[index],
                    precipitation: precipitationProbability[index],
                    weatherIcon: Parser.weatherIcon(for: weatherCode[index]),
                )
            )
        }

        return hourlyForecast
    }
}
