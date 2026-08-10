//
//  ContentView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import SwiftUI

struct ContentView: View {
    var city = "Tijuana"
    let viewModel = ForecastViewModel()

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 40) {
                CurrentForecastView(
                    city: city,
                    temperature: viewModel.current?.temperature ?? 0,
                    weatherDescription: viewModel.current?.weatherDescription ?? "Sunny",

                )

                HourlyForecastListView(forecastList: viewModel.hourly ?? [])

                DailyListView(dataList: viewModel.daily ?? [])
            }
            .padding()
            .task {
                await viewModel.getWeather()
            }
        }
        .background(.weatherApp)
    }
}

#Preview {
    ContentView()
}
