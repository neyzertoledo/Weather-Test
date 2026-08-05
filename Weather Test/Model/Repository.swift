//
//  Repository.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 05/08/26.
//

import Foundation

public class Repository {
    private let openMeteoService = OpenMeteoService(
        latitude: 32.51567520586737,
        longitude: -117.01188324489881
    )
    func getForecast() async throws -> Forecast {
        return try await openMeteoService.request(
            current: true,
            hourly: true,
            daily: true
        ).toModel()
    }
}
