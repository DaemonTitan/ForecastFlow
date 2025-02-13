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
    private let weatherDataServices: WeatherServices
    
    @Published var backgroundColour: LinearGradient? = GradientBackgroundColours.instance.sunnyDay
    @Published var currentWeatherData: CurrentWeatherModel? = nil
    @Published var forecastWeatherData: [ForecastList] = []
    @Published var filteredDailyForecast: [ForecastList] = []
    @Published var iconImage: IconImages = .Default
    
    init(weatherDataServices: WeatherServices) {
        self.weatherDataServices = weatherDataServices
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.currentWeatherData = WeatherMokeData.instance.currentWeather
            self.filteredDailyForecast = WeatherMokeData.instance.forecastWeather
            self.showBackgroundColour()
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
    
    // Repeated
    @MainActor
    func forecastDateFilter(dateSegment: String) async {
       filteredDailyForecast = forecastWeatherData.filter({ item in
            guard let tomorrow = Date.tomorrow else { return true }
            if let localDate = item.localDateTime {
                switch dateSegment {
                case L10n.Day.today:
                    return Tools.isSameDay(date1: localDate, date2: Date.today)
                case L10n.Day.tomorrow:
                    return Tools.isSameDay(date1: localDate, date2: tomorrow)
                case L10n.Day.next3Days:
                    return Tools.isSameDay(date1: localDate, date2: Date.today) && Tools.isSameDay(date1: localDate, date2: tomorrow)
                default:
                    return true
                }
            }
            return true
        })
    }
    
    var displayCurrentDate: String {
        return Tools.fetchCurrentDateTime(format: L10n.DateFormat.dateFormat).currentDateTimeString
    }
    
    func showBackgroundColour() {
        self.backgroundColour = Tools.setBackgroundColour(weatherData: currentWeatherData)
    }
    
    func weatherDetail(_ weatherDataType: String) -> String {
       return Tools.weatherData(weatherDataType: weatherDataType, weatherData: currentWeatherData)
    }
}
