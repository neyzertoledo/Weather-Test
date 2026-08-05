//
//  OpenMeteoDaily.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

struct OpenMeteoDaily: Codable {
    let time: [String]
    let temperature2MMax: [Double]
    let temperature2MMin: [Double]
    let precipitationProbabilityMax: [Int]
    let weatherCode: [Int]

    func toModel() throws -> [DailyForecast] {
        var dailyForecast: [DailyForecast] = []

        for index in 1..<time.count {
            dailyForecast.append(
                DailyForecast(
                    time: try Parser.timeParser(for: time[index]),
                    temperatureMax: temperature2MMax[index],
                    temperatureMin: temperature2MMin[index],
                    precipitationMax: precipitationProbabilityMax[index],
                    weatherIcon: Parser.weatherIcon(for: weatherCode[index]),
                )
            )
        }

        return dailyForecast
    }
}
