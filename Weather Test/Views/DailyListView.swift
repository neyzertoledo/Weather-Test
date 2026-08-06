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
        ScrollView() {
            Text("10-day forecast")
                .font(.headline)
                .padding(5)
            VStack(spacing: 5) {
                ForEach(dataList, id: \.self) { data in
                    DailyCardView(data: data)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(.blue,lineWidth: 5)
        }
    }
}

#Preview {
    DailyListView(dataList: MockData.dailyData())
        .padding()
}
