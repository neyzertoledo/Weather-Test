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
        HStack {
            VStack {
                CurrentCardsView(title: Strings.precipitation, icon: "drop.fill", data: ("\(data.precipitation)mm"))
                CurrentCardsView(title: Strings.feelsLike, icon: "thermometer.variable", data: Constants.temperature(temp: data.feelsLike, unit: .celsius))
            }
            VStack {
                CurrentCardsView(title: Strings.humidity, icon: "humidity.fill", data: ("\(data.humidity)%"))
                CurrentCardsView(title: Strings.humidity, icon: "wind", data: ("\(data.windSpeed)km/h"))
            }
        }
    }
}

#Preview {
    CurrentListCards(data: CurrentForecast.mock())
}
