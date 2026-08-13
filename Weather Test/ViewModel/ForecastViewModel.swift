//
//  ForecastViewModel.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 04/08/26.
//
import Foundation

@Observable
class ForecastViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case permissionsDenied
        case failed(underlyingError: Error)
    }

    private(set) var homeStatus: FetchStatus = .notStarted
    private let repository: Repository = .init()
    var current: CurrentForecast = .mock()
    var daily: [DailyForecast] = []
    var hourly: [HourlyForecast] = []

    init() {
        self.homeStatus = .fetching
        self.current = .mock()
        self.daily = []
        self.hourly = []
    }

    func getWeather() async {
        homeStatus = .fetching

        do {
            let weather = try await repository.getForecast()
            print("Success!")
            self.current = weather.current
            self.daily = weather.daily
            self.hourly = weather.hourly
            
            homeStatus = .success
        } catch LocationError.permissionDenied {
            homeStatus = .permissionsDenied
        } catch {
            print("Error :(: \(error)" )
            homeStatus = .failed(underlyingError: error)
        }

    }

}
