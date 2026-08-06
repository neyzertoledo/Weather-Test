//
//  WeatherIconParser.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 04/08/26.
//

import Foundation

struct Parser {
    static func weatherIcon(for code: Int, isDay: Bool = true) -> WeatherIcons {
        switch code {
        case 0, 1:
            return isDay ? .clearDay : .clearNight
        case 2:
            return isDay ? .cloudDay : .cloudNight
        case 3:
            return .cloud
        case 45, 48:
            return .cloudFog
        case 61, 63, 65:
            return .rain
        case 71, 73, 75:
            return .snow
        case 95, 96, 99:
            return .thunderstorm
        default:
            return .unknown
        }
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

    static func timeParser(for time: String) throws -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = time.count == 10 ? "yyyy-MM-dd" : "yyyy-MM-dd'T'HH:mm"
        if time.count == 10 {
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
        }

        guard let date = formatter.date(from: time) else {
            throw NSError(
                domain: "timeParser",
                code: 0,
                userInfo: [
                    NSLocalizedDescriptionKey: "Not valid date format: \(time)"
                ]
            )
        }

        return date
    }

}
