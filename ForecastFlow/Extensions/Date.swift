//
//  Date.swift
//  ForecastFlow
//
//  Created by Tony Chen on 1/10/2024.
//

import Foundation

extension Date {
    
    var dayStart: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var dayAfter: Date? {
        let current = Calendar.current
        guard let todayAfter = current.date(byAdding: .day, value: 1, to: self) else { return nil }
        return todayAfter.dayStart
    }
    
    static var today: Date {
        return Date().dayStart
    }
    
    static var tomorrow: Date? {
        guard let nextDay = Date().dayAfter else { return nil }
        return nextDay
    }
    
    /// Compare 2 dates are in same day
    /// ```
    /// Compare 2 dates
    /// ```
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents([.year, .month, .day], from: date1)
        let components2 = calendar.dateComponents([.year, .month, .day], from: date2)
        return components1.year == components2.year &&
        components1.month == components2.month &&
        components1.day == components2.day
    }
    
    /// Returns date and time by given time format.
    /// ```
    /// Convert UTC date time ?? to local current time in "yyy-MM-dd HH:mm:ss" format
    /// ```
    func fetchDateTime(dateTimeFormat: String) -> String {
        let currentCalendar = Calendar.current
        let now = Date()
        
        if currentCalendar.isDate(self, equalTo: now, toGranularity: .hour) {
            return L10n.Time.now
        } else {
            let format = dateTimeFormat
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            return dateFormatter.string(from: self)
        }
    }

}
