//
//  WeatherIconParser.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 04/08/26.
//

import Foundation

struct Parser {
    static func weatherIcon(for code: Int, isDay: Bool = true) -> String {
        switch code {
        case 0, 1:
            return isDay ? "sun.max" : "moon.stars"
        case 2:
            return isDay ? "cloud.sun" : "cloud.moon"
        case 3:
            return "cloud"
        case 45, 48:
            return "cloud.fog"
        case 61, 63, 65:
            return "cloud.rain"
        case 71, 73, 75:
            return "cloud.snow"
        case 95, 96, 99:
            return "cloud.bolt.rain"
        default:
            return "questionmark.circle"
        }
    }

    static func weatherIcon(for codes: [Int]) -> [String] {
        var weatherIcons: [String] = []
        codes.forEach { code in
            weatherIcons.append(weatherIcon(for: code))
        }
        return weatherIcons
    }

    static func weatherDescription(for code: Int, isDay: Bool = true) -> String {
        switch code {
        case 0:
            return isDay ? "Sunny" : "Clear"
        case 1:
            return isDay ? "Mostly Sunny" : "Mostly Clear"
        case 2:
            return isDay ? "Partly Cloudy" : "Partly Cloudy"
        case 3:
            return "Cloudy"
        case 45:
            return "Foggy"
        case 48:
            return "Freezing Fog"
        case 51:
            return "Light Drizzle"
        case 53:
            return "Moderate Drizzle"
        case 55:
            return "Heavy Drizzle"
        case 56, 57:
            return "Freezing Drizzle"
        case 61:
            return "Light Rain"
        case 63:
            return "Moderate Rain"
        case 65:
            return "Heavy Rain"
        case 66, 67:
            return "Freezing Rain"
        case 71:
            return "Light Snow"
        case 73:
            return "Moderate Snow"
        case 75:
            return "Heavy Snow"
        case 77:
            return "Snow Grains"
        case 80:
            return "Light Rain Showers"
        case 81:
            return "Moderate Rain Showers"
        case 82:
            return "Heavy Rain Showers"
        case 85:
            return "Light Snow Showers"
        case 86:
            return "Heavy Snow Showers"
        case 95:
            return "Thunderstorm"
        case 96:
            return "Thunderstorm with Light Hail"
        case 99:
            return "Thunderstorm with Heavy Hail"
        default:
            return "Unknown"
        }
    }



}
