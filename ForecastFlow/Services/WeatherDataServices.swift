//
//  NetwordServices.swift
//  ForecastFlow
//
//  Created by Tony Chen on 15/9/2024.
//

import Foundation

class WeatherDataServices {
    var currentWeatherData: CurrentWeatherModel? = nil
    var forecastWeatherData: ForecastWeatherData? = nil
    
    func decodeCurrentWeatherData(lat: Double, lon: Double, units: String, apiKey: String, locationName: String) async throws -> CurrentWeatherModel? {
        do {
            guard let url = URLs.getCurrentWeatherURL(lat: lat, lon: lon, apikey: apiKey, units: units) else { throw NetwordError.decodingError }
            let data = try await NetwordManager.downloadWeatherData(from: url)
            let currentWeather = try JSONDecoder().decode(CurrentWeatherModel.self, from: data)
            self.currentWeatherData = currentWeather.updateWeatherData(cityName: locationName)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Missing key: \(key) in context: \(context)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type mismatch for type \(type) in context: \(context)")
        } catch let DecodingError.valueNotFound(value, context) {
            print("Missing value for \(value) in context: \(context)")
        } catch let DecodingError.dataCorrupted(context) {
            print("Data corrupted in context: \(context)")
        } catch {
            print("Failed to decode City: \(error)")
        }
        return currentWeatherData
    }
    
    func decodeForecastWeatherData(lat: Double, lon: Double, units: String, apiKey: String) async throws -> [ForecastList] {
        do {
            guard let url = URLs.getForecastWeatherURL(lat: lat, lon: lon, apikey: apiKey, units: units) else { throw NetwordError.decodingError }
            let data = try await NetwordManager.downloadWeatherData(from: url)
            self.forecastWeatherData = try JSONDecoder().decode(ForecastWeatherData.self, from: data)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Missing key: \(key) in context: \(context)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type mismatch for type \(type) in context: \(context)")
        } catch let DecodingError.valueNotFound(value, context) {
            print("Missing value for \(value) in context: \(context)")
        } catch let DecodingError.dataCorrupted(context) {
            print("Data corrupted in context: \(context)")
        } catch {
            print("Failed to decode City: \(error)")
        }
        return forecastWeatherData?.list ?? []
    }
}
