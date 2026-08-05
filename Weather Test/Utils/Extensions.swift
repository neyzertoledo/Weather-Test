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
        return "\(hour%12)\(time)"
    }

    func adding(hours: Int) -> Date {
        let newDate = Calendar.current.date(byAdding: .hour, value: hours, to: self)
        return newDate ?? self
    }
}
