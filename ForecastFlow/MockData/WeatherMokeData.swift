//
//  CurrentWeatherMokeData.swift
//  ForecastFlow
//
//  Created by Tony Chen on 30/9/2024.
//

import Foundation

class WeatherMokeData {
    static let instance = WeatherMokeData()
    
    let homeVM = HomeViewModel(weatherDataServices: WeatherDataServices())
    let locationServices = LocationManager()
    
    let currentWeather = CurrentWeatherModel(
        coord: Coord(
            lon: -33.7735015,
            lat: 151.2727221),
        weather: [Weather(
            id: 801,
            main: "Clouds",
            description: "few clouds",
            icon: "09d")],
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
        name: "Brookvale",
        cityName: "Sydney")
    
    let selectedCityCurrentWeather = CurrentWeatherModel(
        coord: Coord(
            lon: 115.8917,
            lat: -31.9944),
        weather: [Weather(
            id: 800,
            main: "Clear",
            description: "clear sky",
            icon: "08d")],
        main: Main(
            temp: 31.13,
            feelsLike: 29.46,
            tempMin: 31.01,
            tempMax: 33.38,
            pressure: 1014,
            humidity: 25,
            seaLevel: 1014,
            grndLevel: 1008),
        visibility: 10000,
        wind: Wind(
            speed: 3.09,
            deg: 110,
            gust: 3.58),
        clouds: Clouds(
            all: 0),
        dt: 1731473751,
        sys: Sys(
            sunrise: 1731445787,
            sunset: 1731495110),
        timezone: 28800,
        id: 7839638,
        name: "South Perth",
        cityName: "South Perth")
    
    let forecastWeather = [
        ForecastList(
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
            dtTxt: "2024-11-13 03:00:00",
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
                   dtTxt: "2024-11-14 04:00:00",
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
                   dtTxt: "2024-11-15 06:00:00",
                   rain: Rain(rain3H: 12.5),
                   snow: Snow(snow3H: 0.0)),
        ]
    
    let selectedCityForecastWeather = [
        ForecastList(
            dt: 1731477600,
            main: MainClass(
                temp: 32.24,
                feelsLike: 30.10,
                tempMin: 27.63,
                tempMax: 28.63,
                pressure: 1013,
                seaLevel: 1014,
                grndLevel: 1014,
                humidity: 20,
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
            dtTxt: "2024-11-13 03:00:00",
            rain: Rain(rain3H: 12.5),
            snow: Snow(snow3H: 0.0)),
               
               ForecastList(
                   dt: 1728302402,
                   main: MainClass(
                    temp: 28.9,
                    feelsLike: 23.76,
                       tempMin: 30.63,
                       tempMax: 20.63,
                       pressure: 1012,
                       seaLevel: 1014,
                       grndLevel: 1014,
                       humidity: 75,
                       tempKf: 0),
                   weather: [ForecastWeather(
                       id: 802,
                       main: "Clear",
                       description: "clear sky",
                       icon: "01d")],
                   clouds: ForecastClouds(all: 31),
                   wind: ForecastWind(speed: 5.99, deg: 144, gust: 6.07),
                   visibility: 10000,
                   pop: 0.62,
                   sys: DayNight(pod: "n"),
                   dtTxt: "2024-11-14 04:00:00",
                   rain: Rain(rain3H: 12.5),
                   snow: Snow(snow3H: 0.0)),
               
               ForecastList(
                   dt: 1728302403,
                   main: MainClass(
                    temp: 35.90,
                    feelsLike: 31.76,
                    tempMin: 15.67,
                    tempMax: 37.87,
                    pressure: 1017,
                    seaLevel: 1018,
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
                   dtTxt: "2024-11-15 06:00:00",
                   rain: Rain(rain3H: 12.5),
                   snow: Snow(snow3H: 0.0)),
        ]
    
    
    let location = [
        CityData(title: "Sydney", subtitle: "NSW Australia", city: "", state: "NSW", country: "Australia", latitude: 0.0, longitude: 0.0),
        CityData(title: "Melbroune", subtitle: "Vic Australia", city: "", state: "Victory", country: "Australia", latitude: 0.0, longitude: 0.0),
        CityData(title: "Hobart", subtitle: "Tas Australia", city: "", state: "Tasmania", country: "Australia", latitude: 0.0, longitude: 0.0),
        CityData(title: "Brisbane", subtitle: "Queensland Australia", city: "", state: "Queensland", country: "Australia", latitude: 0.0, longitude: 0.0),
        CityData(title: "Perth", subtitle: "West Australia", city: "", state: "West Australia", country: "Australia", latitude: -31.959242, longitude: 115.8672597)
    ]
}
