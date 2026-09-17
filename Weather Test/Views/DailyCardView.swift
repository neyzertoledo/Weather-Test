//
//  DailyCardView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 06/08/26.
//

import SwiftUI

struct DailyCardView: View {
    let data: DailyForecast
    let globaltempMin: Double
    let globaltempMax: Double

    private var width: Double {
        (data.temperatureMax - data.temperatureMin) /
        (globaltempMax - globaltempMin)
    }
    private var start: Double {
        (data.temperatureMin - globaltempMin) /
        (globaltempMax - globaltempMin)
    }

    var body: some View {
        HStack {
            Text(data.time.relativeDayText)
                .frame(width: 100, alignment: .leading)

            Spacer()

            Image(systemName: data.weatherIcon.rawValue)

            Spacer()

            HStack {
                Text(Constants.temperature(temp: data.temperatureMin))
                GradientLineView(widthPercent: width, startPercent: start)
                Text(Constants.temperature(temp: data.temperatureMax))
            }
            .frame(width: 180, alignment: .center)
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
        temperatureMax: 25,
        temperatureMin: 21,
        precipitationMax: 0,
        weatherIcon: .clearDay),
       globaltempMin: 19, globaltempMax: 25
    )
    DailyCardView( data: DailyForecast(
        time: specificDate ?? Date().adding(days: 1),
        temperatureMax: 22,
        temperatureMin: 19,
        precipitationMax: 0,
        weatherIcon: .clearDay),
      globaltempMin: 19, globaltempMax: 25
    )
}
