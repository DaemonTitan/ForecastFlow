//
//  Double.swift
//  ForecastFlow
//
//  Created by Tony Chen on 1/10/2024.
//

import Foundation

extension Double {
    
    /// Convert Meter per second to Kilometer per hour
    /// ```
    /// Convert 1 m/s to "3.6"
    /// Convert 2 m/s to "7.2"
    /// convert 3 m/s to "10.8"
    /// ```
    func convertMeterSecToKmh() -> String {
        let number = self * 3.6
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 1
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) else { return L10n.notAvailable }
        return formattedNumber
    }
    
    /// Convert Mile per hour to Kilometer per hour
    /// ```
    /// Convert 1 mi/h to "1.609344"
    /// Convert 2 mi/h to "3.218688"
    /// convert 3 mi/h to "4.828032"
    /// ```
    func convertMileHourToKmh() -> String {
        return String(self * 1.609344)
    }
    
    /// Convert double to string
    /// ```
    /// Convert 1  to "1.60"
    /// Convert 2  to "3.21"
    /// convert 3  to "4.82"
    /// ```
    func doubleToString() -> String {
        let number = Int(self.rounded())
        return String(number)
    }
}
