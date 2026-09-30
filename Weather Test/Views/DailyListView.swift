//
//  DailyListView.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 06/08/26.
//

import SwiftUI

struct DailyListView: View {
    let dataList: [DailyForecast]
    let currentTemp: Double
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
                    ForEach(Array(dataList.enumerated()), id: \.element) { index, data in
                        let tempDiff = tempMax - tempMin
                        let lineWidth = (data.temperatureMax - data.temperatureMin) / tempDiff
                        let lineStart = (data.temperatureMin - tempMin) / tempDiff
                        let currentPoint: CGFloat? = index == 0 ? (currentTemp - tempMin) / tempDiff : nil

                        GridRow {
                            Text(data.time.relativeDayText)

                            Image(systemName: data.weatherIcon.rawValue)

                            Text(Constants.temperature(temp: data.temperatureMin))
                                .monospacedDigit()

                            GradientLineView(
                                widthPercent: lineWidth,
                                startPercent: lineStart,
                                point: currentPoint
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
    DailyListView(dataList: MockData.dailyData(), currentTemp: 18)
        .padding(10)
}
