//
//  HourlyForecastListView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import SwiftUI

struct HourlyForecastListView: View {
    let forecastList : [HourlyForecast]
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                ForEach(forecastList, id: \.self) { hourlyForecast in
                    HourlyForecastCardView(forecast: hourlyForecast)
                }
            }
            .padding()
        }
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(.blue,lineWidth: 5)
        }
        .frame(height: 100)
    }
}


#Preview {
    let dataList: [[Any]] = [
        [Date(), 22.0, 0, "cloud.sun"],
        [Date().adding(hours: 1), 22.0, 0, "cloud.sun"],
        [Date().adding(hours: 2), 23.0, 0, "cloud.sun"],
        [Date().adding(hours: 3), 25.0, 0, "cloud.sun"],
        [Date().adding(hours: 4), 27.0, 0, "cloud.sun"],
        [Date().adding(hours: 5), 25.0, 0, "cloud.sun"],
        [Date().adding(hours: 6), 24.0, 0, "cloud.sun"],
        [Date().adding(hours: 7), 24.0, 0, "cloud.sun"],
        [Date().adding(hours: 8), 22.0, 0, "cloud.sun"],
        [Date().adding(hours: 9), 20.0, 0, "cloud.sun"],
        [Date().adding(hours: 10), 20.0, 0, "cloud.sun"]
    ]

    let forecastData = dataList.map { item in
        HourlyForecast(
            time: item[0] as! Date,
            temperature: item[1] as! Double,
            precipitation: item[2] as! Int,
            weatherIcon: item[3] as! String
        )
    }
    HourlyForecastListView( forecastList: forecastData)
}


