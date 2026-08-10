//
//  CurrentForecastView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 05/08/26.
//

import SwiftUI

struct CurrentForecastView: View {
    let city: String
    let temperature: Double
    let weatherDescription: String
    var body: some View {
        VStack {
            Text(city)
            Text("\(Constants.temperature(temp: temperature, unit: .celsius))")
                .font(.largeTitle)
                .bold(true)
            Text(weatherDescription)
        }
    }
}

#Preview {
    CurrentForecastView(
        city: "Tijuana",
        temperature: 22,
        weatherDescription: "Mostly Sunny"
    )
}
