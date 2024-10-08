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
    @Published var forecastWeatherData: [ForecastWeatherData]? = []
    @Published var iconImage: IconImages = .Default
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.currentWeatherData = CurrentWeatherMokeData.instance.currentWeather
        }
    }
    
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
    
    @MainActor
    func fetchForecastWeatherData() async {
        do {
            let coordinates = locationManager.fetchCoordinates()
            self.forecastWeatherData = try await weatherDataServices.decodeForecastWeatherData(
                lat: coordinates.0,
                lon: coordinates.1,
                units: "metric",
                apiKey: ConfigTools.getKeys())
        } catch {
            print("Fetch forecast weather data error: \(error.localizedDescription)")
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
        default:
            return "\(L10n.notAvailable)"
        }
    }
}
