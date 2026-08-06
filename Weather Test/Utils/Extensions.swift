//
//  Extensions.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 05/08/26.
//

import Foundation

extension Date {
    var hour: Int {
        Calendar.current.component(.hour, from: self)
    }

    var simpleHour: String {
        let time = self.hour < 12 ? "am" : "pm"
        let hourTime = self.hour%12 == 0 ? 12 : self.hour%12
        return "\(hourTime)\(time)"
    }

    var dayText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }

    var relativeDayText: String {
        return Date() == self ? "Today" : dayText
    }

    func adding(hours: Int = 0, days: Int = 0) -> Date {
        let daysTime = days*24*60*60
        let hoursTime = hours*60*60
        return self.addingTimeInterval(TimeInterval(daysTime+hoursTime))
    }
}
