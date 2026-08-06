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
        ScrollView {
            VStack(spacing: 40) {
                CurrentForecastView(
                    city: city,
                    currentForecast: viewModel.current
                )

                HourlyForecastListView(forecastList: viewModel.hourly ?? [])

                DailyListView(dataList: viewModel.daily ?? [])
            }
            .padding()
            .task {
                await viewModel.getWeather()
            }
        }
    }
}

#Preview {
    ContentView()
}
