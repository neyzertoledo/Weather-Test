//
//  HourlyForecastCardView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//
import SwiftUI

struct HourlyForecastCardView: View {
    let forecast: HourlyForecast

    var body: some View {
        VStack {
            Text("\(forecast.time.simpleHour)")
            Spacer()
            Image(systemName: forecast.weatherIcon)
            Spacer()
            Text(Constants.temperature(temp: forecast.temperature, unit: .celsius))
        }
    }
}

#Preview {
    HourlyForecastCardView(forecast: HourlyForecast(
            time: Date.now,
            temperature: 22,
            precipitation: 1,
            weatherIcon: "cloud.sun"
        )
    ).frame(width: 100, height: 100)
}
