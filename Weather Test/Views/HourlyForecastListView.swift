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

            Text(Strings.hourlyForecast)
                .padding(.top)
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(.headline)
                .textCase(.uppercase)

            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(forecastList, id: \.self) { hourlyForecast in
                        HourlyForecastCardView(forecast: hourlyForecast)
                    }
                }
            }
            .padding(.bottom, 20)
        }
        .cardView()
    }
}


#Preview {
    HourlyForecastListView( forecastList: MockData.hourlyData())
        .frame(maxHeight: 200)
}


