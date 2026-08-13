//
//  ContentView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ForecastViewModel()

    var body: some View {
        ScrollView(.vertical) {
            switch viewModel.homeStatus {
            case .notStarted:
                EmptyView()
            case .fetching:
                VStack(spacing: 12) {
                    Text(Strings.gettinWeatherData)
                    ProgressView()
                        .frame(maxWidth: .infinity)
                }
            case .permissionsDenied:
                VStack(spacing: 12) {
                    Image(systemName: "location.slash")
                        .font(.largeTitle)
                    Text(Strings.locationPermisionDenied)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding()
            case .failed(let error):
                Text("Error: " + error.localizedDescription)
            case .success:
                VStack(spacing: 20) {
                    CurrentForecastView(
                        city: viewModel.cityName,
                        temperature: viewModel.current.temperature,
                        weatherDescription: viewModel.current.weatherDescription
                    )

                    HourlyForecastListView(forecastList: viewModel.hourly)

                    DailyListView(dataList: viewModel.daily)

                    CurrentListCards(data: viewModel.current)

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
