//
//  ForecastViewModel.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 04/08/26.
//
import Foundation

@Observable
class ForecastViewModel {
    private let repository: Repository = .init()
    var current: CurrentForecast? = nil
    var daily: [DailyForecast]? = nil
    var hourly: [HourlyForecast]? = nil

    func getWeather() async {
        do {
            let weather = try await repository.getForecast()
            print("Success!")
            self.current = weather.current
            self.daily = weather.daily
            self.hourly = weather.hourly
        } catch {
            print("Error :(")
        }

    }

}
