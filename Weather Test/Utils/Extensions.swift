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
        let formatter = DateFormatter()
        formatter.dateFormat = "ha"
        return formatter.string(from: self)
    }

    var dayText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }

    var relativeDayText: String {
        return Date().formatted(date: .numeric, time: .omitted) == self.formatted(date: .numeric, time: .omitted) ?
        "Today" : dayText
    }
    
    func adding(hours: Int = 0, days: Int = 0) -> Date {
        let daysTime = days*24*60*60
        let hoursTime = hours*60*60
        return self.addingTimeInterval(TimeInterval(daysTime+hoursTime))
    }
}
