//
//  CurrentWeatherViewModel.swift
//  ForecastFlow
//
//  Created by Tony Chen on 17/9/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let locationManager = LocationManager()
    private let weatherDataServices = WeatherDataServices()
    
    @Published var currentWeatherData: CurrentWeatherModel? = nil
    @Published var iconImage: iconImages = .Default
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.currentWeatherData = CurrentWeatherMokeData.instance.currentWeather
        }
    }
    
    enum iconImages {
        case SunnyIcon
        case CloudyIcon
        case RainSnowIcon
        case FogIcon
        case NightWeatherIcon
        case Default
    }
    
    @MainActor
    func fetchCurrentWeatherData() async {
        do {
            let coordinates = locationManager.fetchCoordinates()
            self.currentWeatherData = try await weatherDataServices.decodeCurrentWeatherData(
                lat: coordinates.0,
                lon: coordinates.1,
                units: "metric",
                apiKey: ConfigTools.getKeys())
        } catch {
            print("Fetch current weather data error: \(error.localizedDescription)")
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
}
