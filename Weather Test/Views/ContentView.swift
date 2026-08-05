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
    var weather: String = "Mostly Sunny"
    let viewModel = OpenMeteoViewModel()

    var body: some View {
        VStack {
            VStack {
                Text(city)
                Text("\(Constants.temperature(temp: viewModel.current?.temperature ?? 0, unit: .celsius))")
                    .font(.largeTitle)
                    .bold(true)
                Image(systemName: viewModel.current?.weatherIcon ?? "sun.max.fill")
                    .font(.title)
                Text(weather)
            }

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
