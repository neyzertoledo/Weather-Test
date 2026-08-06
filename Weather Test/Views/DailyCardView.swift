//
//  DailyCardView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 06/08/26.
//

import SwiftUI

struct DailyCardView: View {
    let data: DailyForecast
    var body: some View {
        HStack {
            Text(data.time.relativeDayText)
            Spacer()
            Image(systemName: data.weatherIcon.rawValue)
            Spacer()
            Text(Constants.temperature(temp: data.temperatureMin))
            Text("----")
            Text(Constants.temperature(temp: data.temperatureMax))
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

#Preview {
    DailyCardView( data: DailyForecast(
        time: Date(),
        temperatureMax: 24,
        temperatureMin: 17,
        precipitationMax: 0,
        weatherIcon: .clearDay)
    )
    DailyCardView( data: DailyForecast(
        time: Date().adding(days: 1),
        temperatureMax: 24,
        temperatureMin: 17,
        precipitationMax: 0,
        weatherIcon: .clearDay)
    )
}
