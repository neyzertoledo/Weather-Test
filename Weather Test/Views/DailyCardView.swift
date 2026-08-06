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
                .frame(width: 100, alignment: .leading)

            Spacer()

            Image(systemName: data.weatherIcon.rawValue)

            Spacer()

            Group {
                Text(Constants.temperature(temp: data.temperatureMin))
                Text("----")
                Text(Constants.temperature(temp: data.temperatureMax))
            }
            .frame(width: 40, alignment: .trailing)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

#Preview {
    let formatter = ISO8601DateFormatter()
    let specificDate = formatter.date(from: "2026-08-06T00:00:00Z")
    DailyCardView( data: DailyForecast(
        time: Date(),
        temperatureMax: 24,
        temperatureMin: 17,
        precipitationMax: 0,
        weatherIcon: .clearDay)
    )
    DailyCardView( data: DailyForecast(
        time: specificDate ?? Date().adding(days: 1),
        temperatureMax: 24,
        temperatureMin: 17,
        precipitationMax: 0,
        weatherIcon: .clearDay)
    )
}
