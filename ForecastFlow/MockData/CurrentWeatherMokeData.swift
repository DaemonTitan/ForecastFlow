//
//  CurrentWeatherMokeData.swift
//  ForecastFlow
//
//  Created by Tony Chen on 30/9/2024.
//

import Foundation

class CurrentWeatherMokeData {
    static let instance = CurrentWeatherMokeData()
    
    let homeVM = HomeViewModel()
    
    let currentWeather = CurrentWeatherModel(
        coord: Coord(
            lon: -33.7735015,
            lat: 151.2727221),
        weather: [Weather(
            id: 801,
            main: "Clouds",
            description: "few clouds",
            icon: "02n")],
        main: Main(
            temp: 15.09,
            feelsLike: 14.61,
            tempMin: 14.1,
            tempMax: 16.3,
            pressure: 1023,
            humidity: 75,
            seaLevel: 1023,
            grndLevel: 1017),
        visibility: 10000,
        wind: Wind(
            speed: 0.89,
            deg: 234,
            gust: 3.58),
        clouds: Clouds(
            all: 17),
        dt: 1727692982,
        sys: Sys(
            sunrise: 1727638402,
            sunset: 1727682982),
        timezone: 36000,
        id: 2208303,
        name: "Brookvale")
}
