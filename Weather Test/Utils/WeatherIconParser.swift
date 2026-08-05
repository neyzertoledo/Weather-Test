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
            return isDay ? "sun.max.fill" : "moon.stars.fill"
        case 2:
            return isDay ? "cloud.sun.fill" : "cloud.moon.fill"
        case 3:
            return "cloud.fill"
        case 45, 48:
            return "cloud.fog.fill"
        case 61, 63, 65:
            return "cloud.rain.fill"
        case 71, 73, 75:
            return "cloud.snow.fill"
        case 95, 96, 99:
            return "cloud.bolt.rain.fill"
        default:
            return "questionmark.circle"
        }
    }


}
