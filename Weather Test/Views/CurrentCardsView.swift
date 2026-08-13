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
            .frame( minWidth: 120, alignment: .leading)

            Text(data)
                .font(.largeTitle)
                .padding()
        }

        .cardView()
    }
}

#Preview {
    CurrentCardsView(title: "Precipitation", icon: "drop.fill", data: "1mm")
}
