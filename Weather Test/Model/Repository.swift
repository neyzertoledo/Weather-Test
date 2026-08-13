//
//  Repository.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 05/08/26.
//

import Foundation
import CoreLocation

public class Repository {
    private let locationService: LocationService

    init(locationService: LocationService = LocationService()) {
        self.locationService = locationService
    }

    func getForecast() async throws -> Forecast {
        let location = try await locationService.requestCurrentLocation()
        let openMeteoService = OpenMeteoService(
            latitude: location.latitude,
            longitude: location.longitude
        )
        return try await openMeteoService.request(
            current: true,
            hourly: true,
            daily: true
        ).toModel()
    }

    func getCityName() async throws -> String {
        return try await locationService.currentCity() 
    }
}
