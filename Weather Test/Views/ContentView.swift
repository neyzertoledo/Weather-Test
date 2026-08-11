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
            switch viewModel.homeStatus {
            case .notStarted:
                EmptyView()
            case .fetching:
                VStack(spacing: 12) {
                    Text("Getting the weather...")
                    ProgressView()
                        .frame(maxWidth: .infinity)
                }
            case .permissionsDenied:
                VStack(spacing: 12) {
                    Image(systemName: "location.slash")
                        .font(.largeTitle)
                    Text("We need locations acces to show the weather")
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding()
            case .failed(let error):
                Text("Error: " + error.localizedDescription)
            case .success:
                VStack(spacing: 40) {
                    CurrentForecastView(
                        city: city,
                        temperature: viewModel.current?.temperature ?? 0,
                        weatherDescription: viewModel.current?.weatherDescription ?? "Sunny"
                    )

                    HourlyForecastListView(forecastList: viewModel.hourly ?? [])

                    DailyListView(dataList: viewModel.daily ?? [])
                }
                .padding()
            }
        }
        .background(.weatherApp)
        .task {
            await viewModel.getWeather()
        }
    }
}


#Preview {
    ContentView()
}
