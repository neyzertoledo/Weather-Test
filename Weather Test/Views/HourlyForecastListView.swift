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
        VStack {

            Text("Hourly forecast")
                .padding(.top)
                .padding(.leading)
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(.headline)
                .textCase(.uppercase)

            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(forecastList, id: \.self) { hourlyForecast in
                        HourlyForecastCardView(forecast: hourlyForecast)
                    }
                }
                .padding()
                .padding(.top, 0)
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(.blue,lineWidth: 5)
        }
        .frame(height: 100)
    }
}


#Preview {
    HourlyForecastListView( forecastList: MockData.hourlyData())
}


