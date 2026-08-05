//
//  CurrentForecastView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 05/08/26.
//

import SwiftUI

struct CurrentForecastView: View {
    let city: String
    let currentForecast: CurrentForecast?
    var body: some View {
        VStack {
            Text(city)
            Text("\(Constants.temperature(temp: currentForecast?.temperature ?? 0, unit: .celsius))")
                .font(.largeTitle)
                .bold(true)
            Image(systemName: currentForecast?.weatherIcon ?? "sun.max")
                .font(.title)
            Text(currentForecast?.weatherDescription ?? "Mostly Sunny")
        }
    }
}

#Preview {
    CurrentForecastView(
        city: "Tijuana",
        currentForecast: CurrentForecast(
            time: Date.now,
            temperature: 22,
            feelsLike: 23,
            isDay: true,
            weatherIcon: "cloud.sun",
            weatherDescription: "Mostly Sunny"
        )
    )
}
