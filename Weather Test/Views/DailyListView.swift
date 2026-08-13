//
//  DailyListView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 06/08/26.
//

import SwiftUI

struct DailyListView: View {
    let dataList: [DailyForecast]
    var body: some View {
        VStack {

            Text(Strings.forecast14Days)
                .font(.headline)
                .padding()
                .textCase(.uppercase)
                .frame(maxWidth: .infinity,alignment: .leading)

            VStack(spacing: 5) {
                ForEach(dataList, id: \.self) { data in
                    DailyCardView(data: data)
                }
            }
            .padding(.horizontal)

        }
        .frame(maxWidth: .infinity)
        .cardView()
    }
}

#Preview {
    DailyListView(dataList: MockData.dailyData())
}
