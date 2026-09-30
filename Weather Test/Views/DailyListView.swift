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
                
                Grid(alignment: .leading, verticalSpacing: 10) {
                    ForEach(dataList, id: \.self) { data in
                        let tempDiff = tempMax - tempMin
                        let lineWidth = (data.temperatureMax - data.temperatureMin) / tempDiff
                        let lineStart = (data.temperatureMin - tempMin) / tempDiff

                        GridRow {
                            Text(data.time.relativeDayText)

                            Image(systemName: data.weatherIcon.rawValue)

                            Text(Constants.temperature(temp: data.temperatureMin))
                                .monospacedDigit()

                            GradientLineView(
                                widthPercent: lineWidth,
                                startPercent: lineStart
                            )

                            Text(Constants.temperature(temp: data.temperatureMax))
                                .monospacedDigit()
                        }
                        .padding(.vertical, 5)
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
