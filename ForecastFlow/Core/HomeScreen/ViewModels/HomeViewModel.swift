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
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.currentWeatherData = CurrentWeatherMokeData.instance.currentWeather
        }
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
    

}
