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
    

}
