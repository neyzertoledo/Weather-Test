//
//  DailyListView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 06/08/26.
//

import SwiftUI

struct DailyListView: View {
    let dataList: [DailyForecast]
    private var tempMax: Double {
        dataList.map(\.temperatureMax).max() ?? 0
    }
    private var tempMin: Double {
        dataList.map(\.temperatureMin).min() ?? 0
    }
    var body: some View {
        CardView {
            VStack {
                
                Text(Strings.forecast14Days)
                    .font(.headline)
                    .padding(.vertical)
                    .textCase(.uppercase)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                VStack(spacing: 5) {
                    ForEach(dataList, id: \.self) { data in
                        DailyCardView(data: data, globaltempMin: tempMin, globaltempMax: tempMax)
                    }
                }
                
            }
        }
    }
}

#Preview {
    DailyListView(dataList: MockData.dailyData())
        .padding(10)
}
