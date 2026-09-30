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

    private var lineWidth: Double {
        (data.temperatureMax - data.temperatureMin) /
        (globaltempMax - globaltempMin)
    }
    private var lineStart: Double {
        (data.temperatureMin - globaltempMin) /
        (globaltempMax - globaltempMin)
    }

    var body: some View {
            HStack {
                Text(data.time.relativeDayText)
                    .frame(alignment: .leading)

                Spacer()

                Image(systemName: data.weatherIcon.rawValue)
                    .frame(alignment: .leading)

                HStack {
                    Text(Constants.temperature(temp: data.temperatureMin))
                    GradientLineView(widthPercent: lineWidth, startPercent: lineStart)
                    Text(Constants.temperature(temp: data.temperatureMax))
                }
        }
        .frame(height: 50)
    }
}

#Preview {
    let formatter = ISO8601DateFormatter()
    let specificDate = formatter.date(from: "2026-08-06T00:00:00Z")
    Group {
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
            temperatureMax: 5,
            temperatureMin: 3,
            precipitationMax: 0,
            weatherIcon: .clearDay),
                       globaltempMin: 3, globaltempMax: 9
        )
    }
    .padding(.horizontal)
}
