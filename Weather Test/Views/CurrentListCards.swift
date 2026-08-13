//
//  CurrentListCards.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 11/08/26.
//

import SwiftUI

struct CurrentListCards: View {
    let data: CurrentForecast

    var body: some View {
        VStack (spacing: 20) {
            HStack {
                CurrentCardsView(title: "Precipitation", icon: "drop.fill", data: ("\(data.precipitation)mm"))
                CurrentCardsView(title: "Feels Like", icon: "thermometer.variable", data: Constants.temperature(temp: data.feelsLike, unit: .celsius))
            }
            HStack {
                CurrentCardsView(title: "Humidity", icon: "humidity.fill", data: ("\(data.humidity)%"))
                CurrentCardsView(title: "Wind Speed", icon: "wind", data: ("\(data.windSpeed)km/h"))
            }
        }
    }
}

#Preview {
    CurrentListCards(data: CurrentForecast.mock()
    )
}
