//
//  OpenMeteoService.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//

import Foundation
/*
 https://api.open-meteo.com/v1/forecast?
    latitude=20.5888&longitude=-100.3899
    &current=temperature_2m,apparent_temperature,is_day,weather_code
    &hourly=temperature_2m,precipitation_probability,weather_code
    &daily=temperature_2m_max,temperature_2m_min,precipitation_probability_max,weather_code
    &timezone=auto
    &forecast_days=14
    &temperature_unit=celsius
 */

struct OpenMeteoService {
    let latitude: Double
    let longitude: Double
//    func requestAll() throws -> OpenMeteoResponse {
//        url = buildURL(
//            current: [.]
//        )
//    }

    private func buildURL(
        current: [OpenMeteoOptions]? = nil,
        hourly: [OpenMeteoOptions]? = nil,
        daily: [OpenMeteoOptions]? = nil,
        temperatureUnit: TemperatureUnit = .celsius
    ) throws -> URL {

        var queryItems = [
            URLQueryItem(name: "latitude", value: "\(latitude)"),
            URLQueryItem(name: "longitude", value: "\(longitude)"),
            URLQueryItem(name: "timezone", value: "auto"),
            URLQueryItem(name: "forecast_days", value: "14"),
            URLQueryItem(name: "temperature_unit", value: temperatureUnit.rawValue)
        ]

        if let current {
            let value = current.map(\.rawValue).joined(separator: ",")
            queryItems.append(
                URLQueryItem(name: "current", value: value)
            )
        }

        if let hourly {
            let value = hourly.map(\.rawValue).joined(separator: ",")
            queryItems.append(
                URLQueryItem(name: "hourly", value: value)
            )
        }

        if let daily {
            let value = daily.map(\.rawValue).joined(separator: ",")
            queryItems.append(
                URLQueryItem(name: "daily", value: value)
            )
        }

        guard let url = URL(string: Constants.baseURL)?
            .appending(queryItems: queryItems)
        else {
            throw OpenMeteoError.invalidURL
        }

        return url
    }
}


enum OpenMeteoOptions: String {
    case temperature = "temperature_2m"
    case temperatureMax = "temperature_2m_max"
    case temperatureMin = "temperature_2m_min"
    case feelsLike = "apparent_temperature"
    case isDay = "is_day"
    case weatherCode = "weather_code"
    case precipitation = "precipitation_probability"
    case precipitationMax = "precipitation_probabilityMax"
    case precipitationMin = "precipitation_probabilityMin"
}

