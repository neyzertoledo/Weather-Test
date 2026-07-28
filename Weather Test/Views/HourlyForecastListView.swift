//
//  HourlyForecastListView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//

import SwiftUI

//struct HourlyForecastListView: View {
//    let hourlyForecast : [HourlyForecast]
//    var body: some View {
//        ScrollView(.horizontal) {
//            HStack(spacing: 10) {
//                ForEach(hourlyForecast, id: \.self) { item in
//                    HourlyForecastCardView(
//                        time: item.time,
//                        icon: item.icon,
//                        temperature: item.temperature
//                    )
//                }
//            }
//            .padding()
//        }
//        .background {
//            RoundedRectangle(cornerRadius: 15, style: .continuous)
//                .stroke(.blue,lineWidth: 5)
//        }
//    }
//}
//
//
//#Preview {
//    HourlyForecastListView(
//        hourlyForecast: [
//            HourlyForecast(temperature: 22, icon: "sun.max", time: "Now"),
//            HourlyForecast(temperature: 23, icon: "cloud.sun", time: "1 PM"),
//            HourlyForecast(temperature: 22, icon: "cloud", time: "2 PM"),
//            HourlyForecast(temperature: 25, icon: "cloud.rain", time: "3 PM")
//        ]
//    )
//    .frame(height: 100)
//}
