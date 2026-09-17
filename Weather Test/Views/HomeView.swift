//
//  HomeView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 25/08/26.
//

import SwiftUI

struct HomeView: View {
    let viewModel = ForecastViewModel()

    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                switch viewModel.homeStatus {
                case .notStarted:
                    EmptyView()
                case .fetching:
                    VStack(spacing: 12) {
                        Text(Strings.gettinWeatherData)
                        ProgressView()
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
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
                        .frame(width: geo.size.width, height: geo.size.height)
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
        }
        .background(.weatherApp)
        .task {
            await viewModel.getWeather()
        }
    }
}

#Preview {
    HomeView()
}
