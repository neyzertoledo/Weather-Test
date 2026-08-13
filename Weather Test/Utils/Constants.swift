//
//  Constants.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import Foundation



struct Strings {
    static let today = "Today"

    static let forecast14Days = "14-day forecast"
    static let hourlyForecast = "Hourly forecast"

    static let gettinWeatherData = "Getting weather data..."
    static let locationPermisionDenied = "We need locations acces to show the weather"
    
    static let precipitation = "Precipitation"
    static let feelsLike = "Feels Like"
    static let humidity = "Humidity"
    static let windSpeed = "Wind Speed"

    struct WeatherStrings {
        static let sunny = "Sunny"
        static let clear = "Clear"
        static let mostlySunny = "Mostly Sunny"
        static let mostlyClear = "Mostly Clear"
        static let partlyCloudy = "Partly Cloudy"
        static let cloudy = "Cloudy"
        static let foggy = "Foggy"
        static let freezingFog = "Freezing Fog"

        static let lightDrizzle = "Light Drizzle"
        static let moderateDrizzle = "Moderate Drizzle"
        static let heavyDrizzle = "Heavy Drizzle"
        static let freezingDrizzle = "Freezing Drizzle"

        static let lightRain = "Light Rain"
        static let moderateRain = "Moderate Rain"
        static let heavyRain = "Heavy Rain"
        static let freezingRain = "Freezing Rain"

        static let lightSnow = "Light Snow"
        static let moderateSnow = "Moderate Snow"
        static let heavySnow = "Heavy Snow"
        static let snowGrains = "Snow Grains"

        static let lightRainShowers = "Light Rain Showers"
        static let moderateRainShowers = "Moderate Rain Showers"
        static let heavyRainShowers = "Heavy Rain Showers"

        static let lightSnowShowers = "Light Snow Showers"
        static let heavySnowShowers = "Heavy Snow Showers"

        static let thunderstorm = "Thunderstorm"
        static let thunderstormWithLightHail = "Thunderstorm with Light Hail"
        static let thunderstormWithHeavyHail = "Thunderstorm with Heavy Hail"

        static let unknown = "Unknown"
    }
}

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

enum WeatherIcons: String {
    case clearDay = "sun.max"
    case clearNight = "moon.stars"
    case cloudDay = "cloud.sun"
    case cloudNight = "cloud.moon"
    case cloud = "cloud"
    case cloudFog = "cloud.fog"
    case drizzle = "cloud.drizzle"
    case rain = "cloud.rain"
    case heavyRain = "cloud.heavyrain"
    case snow = "cloud.snow"
    case sleet = "cloud.sleet"
    case hail = "cloud.hail"
    case thunderstorm = "cloud.bolt.rain"
    case severeThunderstorm = "cloud.bolt"
    case windSnow = "wind.snow"
    case dust = "sun.dust"
    case unknown = "questionmark.circle"
}
