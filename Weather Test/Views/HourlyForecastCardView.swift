//
//  HourlyForecastCardView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 27/07/26.
//
import SwiftUI

struct HourlyForecastCardView: View {
    let time : String
    let icon : String
    let temperature : Double

    var body: some View {
        VStack {
            Text("\(time)")
            Spacer()
            Image(systemName: icon)
            Spacer()
            Text(Constants.temperature(temp: temperature, unit: .celsius))
        }
    }
}

#Preview {
    HourlyForecastCardView(time: "10am", icon: "sun.max", temperature: 22)
        .frame(width: 100, height: 100)
}
