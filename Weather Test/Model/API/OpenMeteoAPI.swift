//
//  OpenMeteoAPI.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import Foundation

struct OpenMeteoAPI: Decodable {
    let timezone: String
    let generationtimeMs: Double
    let utcOffsetSeconds: Int
    let current: OpenMeteoCurrent
    let hourly: OpenMeteoHourly
    let daily: OpenMeteoDaily

    func toModel() throws -> Forecast {
        Forecast(
            current: try current.toModel(),
            hourly: try hourly.toModel(),
            daily: try daily.toModel()
        )
    }
}
