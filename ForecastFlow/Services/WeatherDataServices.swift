//
//  NetwordServices.swift
//  ForecastFlow
//
//  Created by Tony Chen on 15/9/2024.
//

import Foundation

class WeatherDataServices {
    var currentWeatherData: CurrentWeatherModel? = nil
    var forecastWeatherData: [ForecastWeatherData] = []
    
    func decodeCurrentWeatherData(lat: Double, lon: Double, units: String, apiKey: String) async throws -> CurrentWeatherModel? {
        do {
            guard let url = URLs.getCurrentWeatherURL(lat: lat, lon: lon, apikey: apiKey, units: units) else { return nil }
            let data = try await NetwordManager.downloadWeatherData(from: url)
            self.currentWeatherData = try JSONDecoder().decode(CurrentWeatherModel.self, from: data)
        } catch {
            print("Decode Error appears")
        }
        return currentWeatherData
    }
    
    func decodeForecastWeatherData(lat: Double, lon: Double, units: String, apiKey: String) async throws -> [ForecastWeatherData]? {
        do {
            guard let url = URLs.getForecastWeatherURL(lat: lat, lon: lon, apikey: apiKey, units: units) else { return nil }
            let data = try await NetwordManager.downloadWeatherData(from: url)
            self.forecastWeatherData = try JSONDecoder().decode([ForecastWeatherData].self, from: data)
        } catch {
            
        }
        return forecastWeatherData
    }
}
