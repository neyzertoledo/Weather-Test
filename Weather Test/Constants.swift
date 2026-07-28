//
//  Constants.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import Foundation

struct Constants {
    static func temperature(temp: Double, unit: TemperatureUnit) -> String {
        let unitString: String
        if unit == .celsius {
            unitString = "C"
        } else {
            unitString = "f"
        }

        return "\(Int(temp.rounded()))\u{00B0}\(unitString)"
    }
}

enum TemperatureUnit {
    case celsius
    case fahrenheit
}
