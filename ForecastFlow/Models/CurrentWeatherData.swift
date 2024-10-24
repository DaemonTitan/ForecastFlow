//
//  CurrentWeatherData.swift
//  ForecastFlow
//
//  Created by Tony Chen on 14/9/2024.
//

import Foundation

// Current Weather JSON Response
/*
 URL:
 https://api.openweathermap.org/data/2.5/weather?lat=33.6912985&lon=151.1502491&appid=ac641c216f7d0d0abae797bade643f8c
 
 JSON Response:
 {
   "coord": {
     "lon": 151.1502,
     "lat": 33.6913
   },
   "weather": [
     {
       "id": 801,
       "main": "Clouds",
       "description": "few clouds",
       "icon": "02n"
     }
   ],
   "base": "stations",
   "main": {
     "temp": 26.9,
     "feels_like": 29.01,
     "temp_min": 26.9,
     "temp_max": 26.9,
     "pressure": 1017,
     "humidity": 74,
     "sea_level": 1017,
     "grnd_level": 1017
   },
   "visibility": 10000,
   "wind": {
     "speed": 3.13,
     "deg": 152,
     "gust": 3.46
   },
   "clouds": {
     "all": 23
   },
   "dt": 1726321325,
   "sys": {
     "sunrise": 1726256283,
     "sunset": 1726301055
   },
   "timezone": 36000,
   "id": 0,
   "name": "Sydney",
   "cod": 200
 }
 */

struct CurrentWeatherModel: Identifiable, Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys
    let timezone, id: Int
    let name: String
    
    var windSpeedKmh: String {
        return wind?.speed?.convertMeterSecToKmh() ?? ""
    }
}

struct Coord: Codable {
    let lon, lat: Double
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

struct Clouds: Codable {
    let all: Int?
}

struct Sys: Codable {
    let sunrise, sunset: Int
}
