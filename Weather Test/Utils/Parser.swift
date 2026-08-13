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
        case 40...49:
            return .cloudFog
        case 50...59:
            return .drizzle
        case 60...67, 80...82, 91, 92:
            return code >= 64 || code == 82 ? .heavyRain : .rain
        case 68, 69, 83, 84:
            return .sleet
        case 70...79, 85, 86:
            return .snow
        case 87...90:
            return .hail
        case 36...39:
            return .windSnow
        case 4...9, 30...35:
            return .dust
        case 13, 17, 29, 93...99:
            return code >= 97 ? .severeThunderstorm : .thunderstorm

        default:
            return .unknown
        }
    }

    static func weatherDescription(for code: Int, isDay: Bool = true) -> String {
        typealias str = Strings.WeatherStrings
        switch code {
        case 0:
            return isDay ? str.sunny : str.clear
        case 1:
            return isDay ? str.mostlySunny : str.mostlyClear
        case 2:
            return str.partlyCloudy
        case 3:
            return str.cloudy
        case 45:
            return str.foggy
        case 48:
            return str.freezingFog
        case 51:
            return str.lightDrizzle
        case 53:
            return str.moderateDrizzle
        case 55:
            return str.heavyDrizzle
        case 56, 57:
            return str.freezingDrizzle
        case 61:
            return str.lightRain
        case 63:
            return str.moderateRain
        case 65:
            return str.heavyRain
        case 66, 67:
            return str.freezingRain
        case 71:
            return str.lightSnow
        case 73:
            return str.moderateSnow
        case 75:
            return str.heavySnow
        case 77:
            return str.snowGrains
        case 80:
            return str.lightRainShowers
        case 81:
            return str.moderateRainShowers
        case 82:
            return str.heavyRainShowers
        case 85:
            return str.lightSnowShowers
        case 86:
            return str.heavySnowShowers
        case 95:
            return str.thunderstorm
        case 96:
            return str.thunderstormWithLightHail
        case 99:
            return str.thunderstormWithHeavyHail
        default:
            return str.unknown
        }
    }

    static func timeParser(for time: String) throws -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = time.count == 10 ? "yyyy-MM-dd" : "yyyy-MM-dd'T'HH:mm"

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
