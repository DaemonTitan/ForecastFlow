//
//  CurrentWeatherViewModel.swift
//  ForecastFlow
//
//  Created by Tony Chen on 17/9/2024.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    private let locationManager = LocationManager()
    private let weatherDataServices = WeatherDataServices()
    
    @Published var backgroundColour: LinearGradient? = GradientBackgroundColours.instance.sunnyDay
    @Published var currentWeatherData: CurrentWeatherModel? = nil
    @Published var forecastWeatherData: [ForecastList] = []
    @Published var filteredDailyForecast: [ForecastList] = []
    @Published var iconImage: IconImages = .Default
    
    enum IconImages {
        case SunnyIcon
        case CloudyIcon
        case RainSnowIcon
        case FogIcon
        case NightWeatherIcon
        case Default
    }
    
    enum WeatherDataType {
        case MaxAndMin
        case Cloud
        case Humidity
        case Wind
    }
    
    enum OptionList: String, CaseIterable, Identifiable {
        var id: Self { self }
        case today
        case tomorrow
        case next3Days
        
        var displayName: String {
            switch self {
            case .today:
                return L10n.Day.today
            case .tomorrow:
                return L10n.Day.tomorrow
            case .next3Days:
                return L10n.Day.next3Days
            }
        }
    }
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.currentWeatherData = WeatherMokeData.instance.currentWeather
            self.filteredDailyForecast = WeatherMokeData.instance.forecastWeather
            self.setBackgroundColour()
        }
    }
    
    @MainActor
    func fetchCurrentWeatherData() async {
        do {
            let coordinates = await locationManager.fetchCoordinates()
            let cityName = try await locationManager.fetchLocationName(latitude: coordinates.0, longitude: coordinates.1)
            self.currentWeatherData = try await weatherDataServices.decodeCurrentWeatherData(
                lat: coordinates.0,
                lon: coordinates.1,
                units: "metric",
                apiKey: ConfigTools.getKeys(),
                locationName: cityName ?? "")
        } catch {
            print("Fetch current weather data error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func fetchForecastWeatherData() async {
        do {
            let coordinates = await locationManager.fetchCoordinates()
            self.forecastWeatherData = try await weatherDataServices.decodeForecastWeatherData(
                lat: coordinates.0,
                lon: coordinates.1,
                units: "metric",
                apiKey: ConfigTools.getKeys())
        } catch {
            print("Fetch forecast weather data error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func forecastDateFilter(dateSegment: String) async {
       filteredDailyForecast = forecastWeatherData.filter({ item in
            guard let tomorrow = Date.tomorrow else { return true }
            if let localDate = item.localDateTime {
                switch dateSegment {
                case L10n.Day.today:
                    return isSameDay(date1: localDate, date2: Date.today)
                case L10n.Day.tomorrow:
                    return isSameDay(date1: localDate, date2: tomorrow)
                case L10n.Day.next3Days:
                    return isSameDay(date1: localDate, date2: Date.today) && isSameDay(date1: localDate, date2: tomorrow)
                default:
                    return true
                }
            }
            return true
        })
    }
    
    func setBackgroundColour() {
        let weatherNightIcon = currentWeatherData?.weather[0].icon.suffix(1)
        let weatherIcon = currentWeatherData?.weather[0].icon
        
        guard let currentTime = fetchCurrentDateTime(format: L10n.DateFormat.dateTimeFormat).currentDateTime else { return }
        guard let sunriseTime = currentWeatherData?.sys.sunrise.convertUnixTimeToLocalTime(L10n.DateFormat.dateTimeFormat) else { return }
        guard let sunsetTime = currentWeatherData?.sys.sunset.convertUnixTimeToLocalTime(L10n.DateFormat.dateTimeFormat) else { return }
         
        
        // Set sunrise start time and end time to 15mins before and after
        let sunriseStartTime = sunriseTime.addingTimeInterval( -15 * 60 )
        let sunriseEndTime = sunriseTime.addingTimeInterval( 15 * 60 )
        // Set sunset start time and end time to 15mins before and after
        let sunsetStartTime = sunsetTime.addingTimeInterval( -15 * 60 )
        let sunsetEndTime = sunsetTime.addingTimeInterval( 15 * 60 )
        
        if weatherNightIcon == "n" {
            backgroundColour = GradientBackgroundColours.instance.darkNight
        } else if weatherIcon == "02d" {
            backgroundColour = GradientBackgroundColours.instance.sunnyDay
        } else if weatherIcon == "01d" {
            if currentTime >= sunriseStartTime && currentTime <= sunriseEndTime {
                backgroundColour = GradientBackgroundColours.instance.sunraise
            } else if currentTime >= sunsetStartTime && currentTime <= sunsetEndTime {
                backgroundColour = GradientBackgroundColours.instance.sunset
            }
        } else {
            backgroundColour = GradientBackgroundColours.instance.rainyDay
        }
    }
}

extension HomeViewModel {
    func fetchCurrentDateTime(format: String) -> (currentDateTimeString: String, currentDateTime: Date?) {
        let dateTimeFormat = format
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateTimeFormat
        dateFormatter.timeZone = TimeZone.current
        let currentDateTimeString = dateFormatter.string(from: currentDate)
        let currentDateTime = dateFormatter.date(from: currentDateTimeString)
        return (currentDateTimeString, currentDateTime)
    }
    
    func displayCurrentDate() -> String {
        let currentDate = fetchCurrentDateTime(format: "EEEE, MMM d")
        return currentDate.currentDateTimeString
    }
    
    func displayWeatherIcon(icon: String) {
        switch icon {
        case "01d":
            return iconImage = .SunnyIcon
        case "02d":
            return iconImage = .CloudyIcon
        case "03d", "04d", "09d", "10d", "11d", "13d":
            return iconImage = .RainSnowIcon
        case "50d", "50n":
            return iconImage = .FogIcon
        case "01n", "02n", "03n", "04n", "09n", "10n", "11n", "13n":
            return iconImage = .NightWeatherIcon
        default:
            return iconImage = .Default
        }
    }
    
    func weatherData(_ weatherDataType: String) -> String {
        switch weatherDataType {
            // Max/Min Temperature
        case "Max/Min":
            return "\(currentWeatherData?.main.tempMax.doubleToString() ?? "")\(L10n.degree)/\(currentWeatherData?.main.tempMin.doubleToString() ?? "")\(L10n.degree)"
            // Cloud
        case "Cloud":
            return "\(currentWeatherData?.clouds?.all?.intToString() ?? "")\(L10n.percentage)"
            // Humidity
        case "Humidity":
            return "\(currentWeatherData?.main.humidity.intToString() ?? "")\(L10n.percentage)"
            // Wind
        case "Wind":
            return "\(currentWeatherData?.windSpeedKmh ?? "")\(L10n.kilometresPerHour)"
        case "Sunraise":
            return "\(currentWeatherData?.sys.sunrise.unixTimeConverter(L10n.DateFormat.sunRiseSetTimeFormat) ?? "")"
        case "Sunset":
            return "\(currentWeatherData?.sys.sunset.unixTimeConverter(L10n.DateFormat.sunRiseSetTimeFormat) ?? "")"
        default:
            return "\(L10n.notAvailable)"
        }
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents([.year, .month, .day], from: date1)
        let components2 = calendar.dateComponents([.year, .month, .day], from: date2)
        return components1.year == components2.year &&
        components1.month == components2.month &&
        components1.day == components2.day
    }
}
