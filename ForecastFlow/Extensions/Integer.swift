//
//  Integer.swift
//  ForecastFlow
//
//  Created by Tony Chen on 1/10/2024.
//

import Foundation

extension Int {
    func intToString() -> String {
        return String(self)
    }
    
    /// Convert Unix date time
    /// ```
    /// Convert Unix date time to
    /// ```
    func unixTimeConverter(_ dateTimeFormat: String) -> String {
        let unixDate = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateTimeFormat
        var newDateTime = dateFormatter.string(from: unixDate)
        newDateTime = newDateTime
            .replacingOccurrences(of: L10n.Time.uppercaseAM, 
                                  with: L10n.Time.lowercaseAM)
            .replacingOccurrences(of: L10n.Time.uppercasePM, 
                                  with: L10n.Time.lowercasePM)
        return newDateTime
    }
    
    /// Convert Unix date time to local date time
    /// ```
    /// Convert Unix date time to
    /// ```
    func convertUnixTimeToLocalTime(_ dateFormat: String) -> Date? {
        let unixDate = Date(timeIntervalSince1970: TimeInterval(self))
        let dateTimeFormat = dateFormat
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateTimeFormat
        dateFormatter.timeZone = TimeZone.current
        let formattedDateString = dateFormatter.string(from: unixDate)
        let localDateTime = dateFormatter.date(from: formattedDateString)
        return localDateTime
    }
}
