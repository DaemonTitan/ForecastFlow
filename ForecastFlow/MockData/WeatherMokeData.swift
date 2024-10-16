//
//  CurrentWeatherMokeData.swift
//  ForecastFlow
//
//  Created by Tony Chen on 30/9/2024.
//

import Foundation

class WeatherMokeData {
    static let instance = WeatherMokeData()
    
    let homeVM = HomeViewModel()
    
    let currentWeather = CurrentWeatherModel(
        coord: Coord(
            lon: -33.7735015,
            lat: 151.2727221),
        weather: [Weather(
            id: 801,
            main: "Clouds",
            description: "few clouds",
            icon: "01d")],
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
            sunrise: 1729022441,
            sunset: 1729063256),
        timezone: 36000,
        id: 2208303,
        name: "Brookvale")
    
    let forecastWeather =
        [ForecastList(
            dt: 1728302401,
            main: MainClass(
                temp: 23,
                feelsLike: 26.63,
                tempMin: 26.63,
                tempMax: 26.63,
                pressure: 1014,
                seaLevel: 1014,
                grndLevel: 1014,
                humidity: 75,
                tempKf: 0),
            weather: [ForecastWeather(
                id: 802,
                main: "Clouds",
                description: "scattered clouds",
                icon: "03d")],
            clouds: ForecastClouds(all: 31),
            wind: ForecastWind(speed: 5.99, deg: 144, gust: 6.07),
            visibility: 10000,
            pop: 0.62,
            sys: DayNight(pod: "n"),
            dtTxt: "2024-10-16 03:00:00",
            rain: Rain(rain3H: 12.5),
            snow: Snow(snow3H: 0.0)),
               
               ForecastList(
                   dt: 1728302402,
                   main: MainClass(
                    temp: 18.45,
                       feelsLike: 26.63,
                       tempMin: 26.63,
                       tempMax: 26.63,
                       pressure: 1014,
                       seaLevel: 1014,
                       grndLevel: 1014,
                       humidity: 75,
                       tempKf: 0),
                   weather: [ForecastWeather(
                       id: 802,
                       main: "Clouds",
                       description: "scattered clouds",
                       icon: "03n")],
                   clouds: ForecastClouds(all: 31),
                   wind: ForecastWind(speed: 5.99, deg: 144, gust: 6.07),
                   visibility: 10000,
                   pop: 0.62,
                   sys: DayNight(pod: "n"),
                   dtTxt: "2024-10-17 04:00:00",
                   rain: Rain(rain3H: 12.5),
                   snow: Snow(snow3H: 0.0)),
               
               ForecastList(
                   dt: 1728302403,
                   main: MainClass(
                    temp: 30.90,
                       feelsLike: 26.63,
                       tempMin: 26.63,
                       tempMax: 26.63,
                       pressure: 1014,
                       seaLevel: 1014,
                       grndLevel: 1014,
                       humidity: 75,
                       tempKf: 0),
                   weather: [ForecastWeather(
                       id: 802,
                       main: "Clouds",
                       description: "scattered clouds",
                       icon: "03n")],
                   clouds: ForecastClouds(all: 31),
                   wind: ForecastWind(speed: 5.99, deg: 144, gust: 6.07),
                   visibility: 10000,
                   pop: 0.62,
                   sys: DayNight(pod: "n"),
                   dtTxt: "2024-10-18 06:00:00",
                   rain: Rain(rain3H: 12.5),
                   snow: Snow(snow3H: 0.0)),
               
            
               
        ]
}
