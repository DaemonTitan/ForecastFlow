//
//  String.swift
//  ForecastFlow
//
//  Created by Tony Chen on 2/10/2024.
//

import Foundation

extension String {
    
    /// Convert UTC date time to local current time
    /// ```
    /// Convert UTC date time ?? to local current time in "yyy-MM-dd HH:mm:ss" format
    /// ```
    func convertUTCToLocalTime() -> Date? {
        let dateFormat = "yyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let date = dateFormatter.date(from: self) else { return nil }
        return date
    }
}
