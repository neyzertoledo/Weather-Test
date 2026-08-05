//
//  ViewModel.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 04/08/26.
//
import Foundation

@Observable
class OpenMeteoViewModel {
    private let openMeteoService = OpenMeteoService(
        latitude: 32.51567520586737,
        longitude: -117.01188324489881
    )

    var current: CurrentForecast? = nil
    var daily: DailyForecast? = nil
    var hourly: HourlyForecast? = nil

    func getWeather() async {
        do {
            let weather = try await openMeteoService.request(current: true, hourly: true, daily: true)
            print("Success!")
            self.current = weather.current
            self.daily = weather.daily
            self.hourly = weather.hourly
        } catch {
            print("Error :(")
        }

    }

}
