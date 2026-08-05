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


}
