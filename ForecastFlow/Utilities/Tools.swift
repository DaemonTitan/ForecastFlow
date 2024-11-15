//
//  Tools.swift
//  ForecastFlow
//
//  Created by Tony Chen on 26/9/2024.
//

import Foundation
import SwiftUI

final class ConfigTools {
    static func getKeys() -> String {
        guard let key = Bundle.main.infoDictionary?["OpenWeather_APIkey"] as? String else {
                fatalError("Can not find key")
            }
        return key
    }
    

}

final class Tools {
    
    static let instance = Tools()
    
    static func fetchCurrentDateTime(format: String) -> (currentDateTimeString: String, currentDateTime: Date?) {
        let dateTimeFormat = format
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateTimeFormat
        dateFormatter.timeZone = TimeZone.current
        let currentDateTimeString = dateFormatter.string(from: currentDate)
        let currentDateTime = dateFormatter.date(from: currentDateTimeString)
        return (currentDateTimeString, currentDateTime)
    }
    
    
    static func weatherData(weatherDataType: String, weatherData: CurrentWeatherModel?) -> String {
        switch weatherDataType {
            // Max/Min Temperature
        case "Max/Min":
            return "\(weatherData?.main.tempMax.doubleToString() ?? "")\(L10n.degree)/\(weatherData?.main.tempMin.doubleToString() ?? "")\(L10n.degree)"
            // Cloud
        case "Cloud":
            return "\(weatherData?.clouds?.all?.intToString() ?? "")\(L10n.percentage)"
            // Humidity
        case "Humidity":
            return "\(weatherData?.main.humidity.intToString() ?? "")\(L10n.percentage)"
            // Wind
        case "Wind":
            return "\(weatherData?.windSpeedKmh ?? "")\(L10n.kilometresPerHour)"
        case "Sunraise":
            return "\(weatherData?.sys.sunrise.unixTimeConverter(L10n.DateFormat.sunRiseSetTimeFormat) ?? "")"
        case "Sunset":
            return "\(weatherData?.sys.sunset.unixTimeConverter(L10n.DateFormat.sunRiseSetTimeFormat) ?? "")"
        default:
            return "\(L10n.notAvailable)"
        }
    }
    
  
    static func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents([.year, .month, .day], from: date1)
        let components2 = calendar.dateComponents([.year, .month, .day], from: date2)
        return components1.year == components2.year &&
        components1.month == components2.month &&
        components1.day == components2.day
    }
    
    // Repeated
    static func setBackgroundColour(weatherData: CurrentWeatherModel?) -> LinearGradient {
        let weatherNightIcon = weatherData?.weather[0].icon.suffix(1)
        let weatherIcon = weatherData?.weather[0].icon
        
        guard let currentTime = Tools.fetchCurrentDateTime(format: L10n.DateFormat.dateTimeFormat).currentDateTime,
              let sunriseTime = weatherData?.sys.sunrise.convertUnixTimeToLocalTime(L10n.DateFormat.dateTimeFormat),
              let sunsetTime = weatherData?.sys.sunset.convertUnixTimeToLocalTime(L10n.DateFormat.dateTimeFormat) else {
            return GradientBackgroundColours.instance.sunnyDay
        }
        
        // Set sunrise start time and end time to 15mins before and after
        let sunriseStartTime = sunriseTime.addingTimeInterval( -15 * 60 )
        let sunriseEndTime = sunriseTime.addingTimeInterval( 15 * 60 )
        // Set sunset start time and end time to 15mins before and after
        let sunsetStartTime = sunsetTime.addingTimeInterval( -15 * 60 )
        let sunsetEndTime = sunsetTime.addingTimeInterval( 15 * 60 )
        
        if weatherNightIcon == "n" {
            return GradientBackgroundColours.instance.darkNight
        } else if weatherIcon == "02d" {
            return GradientBackgroundColours.instance.sunnyDay
        } else if weatherIcon == "01d" {
            if currentTime >= sunriseStartTime && currentTime <= sunriseEndTime {
                return GradientBackgroundColours.instance.sunraise
            } else if currentTime >= sunsetStartTime && currentTime <= sunsetEndTime {
                return GradientBackgroundColours.instance.sunset
            }
        } else {
            return GradientBackgroundColours.instance.rainyDay
        }
        
        return GradientBackgroundColours.instance.sunnyDay
    }
}
