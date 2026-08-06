//
//  Constants.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import Foundation

struct Constants {
    static let baseURL = "https://api.open-meteo.com/v1/forecast"
    static func temperature(temp: Double, unit: TemperatureUnit = .celsius) -> String {
        let unitString: String
        if unit == .celsius {
            unitString = "C"
        } else {
            unitString = "f"
        }

        return "\(Int(temp.rounded()))\u{00B0}\(unitString)"
    }
}

enum TemperatureUnit: String {
    case celsius
    case fahrenheit
}
/*
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
 */
enum WeatherIcons: String {
    case clearDay = "sun.max"
    case clearNight = "moon.stars"
    case cloudDay = "cloud.sun"
    case cloudNight = "cloud.moon"
    case cloud = "cloud"
    case cloudFog = "cloud.fog"
    case rain = "cloud.rain"
    case snow = "cloud.snow"
    case thunderstorm = "cloud.bolt.rain"
    case unknown = "questionmark.circle"
}
