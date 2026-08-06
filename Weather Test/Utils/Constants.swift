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
