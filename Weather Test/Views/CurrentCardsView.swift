//
//  CurrentCardsView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 11/08/26.
//

import SwiftUI

struct CurrentCardsView: View {
    let title: String
    let icon: String
    let data: String

    var body: some View {
            VStack {
                HStack {
                    Image(systemName: icon)
                    Text(title)
                        .textCase(.uppercase)
                        .font(.callout)
                        .bold()
                }
                .opacity(0.5)
                .frame(maxWidth: .infinity, alignment: .leading)

                Text(data)
                    .font(.title)
                    .padding()
            }
            .frame(maxWidth: .infinity, minHeight: 120)
            .cardView()
    }
}

#Preview {
    HStack {
        CurrentCardsView(title: "a", icon: "drop.fill", data: "1mm")
        CurrentCardsView(title: "Precipitation", icon: "drop.fill", data: "10.0km/h")
    }
}
