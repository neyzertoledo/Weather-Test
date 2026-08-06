//
//  MockData.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 06/08/26.
//
import Foundation

struct MockData {
    static func hourlyData() -> [HourlyForecast] {

        let dataBase: HourlyForecast = HourlyForecast(
            time: Date(),
            temperature: 20,
            precipitation: 1,
            weatherIcon: .cloudDay
        )

        var dataList: [HourlyForecast] = []

        for i in 0..<24 {
            dataList.append(HourlyForecast(
                time: dataBase.time.adding(hours: i),
                temperature: dataBase.temperature + Double.random(in: -4...4),
                precipitation: dataBase.precipitation + Int.random(in: 0...15),
                weatherIcon: .cloudDay
            ))
        }
        return dataList
    }

    static func dailyData() -> [DailyForecast] {
        let dailyBase = DailyForecast(time: Date(), temperatureMax: 24, temperatureMin: 18, precipitationMax: 1, weatherIcon: .clearDay)
        var data: [DailyForecast] = []

        for i in 0..<14 {
            data.append(DailyForecast(
                time: dailyBase.time.adding(days: i),
                temperatureMax: dailyBase.temperatureMax + Double.random(in: -2...2),
                temperatureMin: dailyBase.temperatureMin + Double.random(in: -2...2),
                precipitationMax: dailyBase.precipitationMax + Int.random(in: 0...15),
                weatherIcon: dailyBase.weatherIcon)
            )
        }

        return data
    }

}
