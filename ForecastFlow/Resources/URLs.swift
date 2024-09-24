//
//  URLs.swift
//  ForecastFlow
//
//  Created by Tony Chen on 15/9/2024.
//

import Foundation

struct URLs {
    static func baseURL(data: String) -> String {
        return "https://api.openweathermap.org/data/2.5/\(data)"
    }
    
    static func getCurrentWeatherURL(lat: Double, lon: Double, apikey: String, units: String) -> URL? {
        return URL(string: baseURL(data: "weather") + "?lat=\(lat)&lon=\(lon)&appid=\(apikey)&units=\(units)")
    }
}
