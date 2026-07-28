//
//  ContentView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import SwiftUI

struct ContentView: View {
    let city = "Tijuana"
    let temp: Int = 22
    let weather: String = "Mostly Sunny"

    var body: some View {
        VStack {
            VStack {
                Text(city)
                Text("\(temp)*")
                    .font(.largeTitle)
                    .bold(true)
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
    }
}

#Preview {
    ContentView()
}
