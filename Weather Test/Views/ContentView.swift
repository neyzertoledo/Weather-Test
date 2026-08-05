//
//  ContentView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import SwiftUI

struct ContentView: View {
    var city = "Tijuana"
    var temp: Double = 0
    let viewModel = OpenMeteoViewModel()

    var body: some View {
        VStack {
            CurrentForecastView(
                city: city,
                currentForecast: viewModel.current
            )

//            HourlyForecastListView()

            ScrollView() {
                Text("10-day forecast")
                    .font(.headline)
                    .padding()
                HStack(spacing: 10) {
                    HStack {
                        Text("Today")
                        Image(systemName: "sun.max")
                        Text("17*")
                        Text("----")
                        Text("17*")
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(.blue,lineWidth: 5)
            }
        }
        .padding()
        .task {
            await viewModel.getWeather()
        }
    }
}

#Preview {
    ContentView()
}
