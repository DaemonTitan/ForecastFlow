//
//  CurrentWeatherViewModel.swift
//  ForecastFlow
//
//  Created by Tony Chen on 17/9/2024.
//

import Foundation

@MainActor
class CurrentWeatherViewModel: ObservableObject {
    private let locationManager = LocationManager()
    private let weatherDataServices = WeatherDataServices()
    
    @Published var currentWeatherData: CurrentWeatherModel? = nil
    
    func fetchCurrentWeatherData() async {
        do {
            let coordinates = locationManager.fetchCoordinates()
            self.currentWeatherData = try await weatherDataServices.decodeCurrentWeatherData(lat: coordinates.0, lon: coordinates.1, units: "metric", apiKey: ConfigTools.getKeys())
        } catch {
            print("Fetch current weather data error: \(error.localizedDescription)")
        }
    }
}
