//
//  ForecastWeatherData.swift
//  ForecastFlow
//
//  Created by Tony Chen on 7/10/2024.
//

import Foundation

// Forecase Weather Response
/*
 URL:
 https://api.openweathermap.org/data/2.5/forecast?lat=33.6912985&lon=151.1502491&appid=37065c28e102f58c0f901251287511bf&units=metric
 
 JSON Response:
 {
   "cod": "200",
   "message": 0,
   "cnt": 40,
   "list": [
     {
       "dt": 1728302400,
       "main": {
         "temp": 26.63,
         "feels_like": 26.63,
         "temp_min": 26.63,
         "temp_max": 26.63,
         "pressure": 1014,
         "sea_level": 1014,
         "grnd_level": 1014,
         "humidity": 75,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 802,
           "main": "Clouds",
           "description": "scattered clouds",
           "icon": "03n"
         }
       ],
       "clouds": {
         "all": 31
       },
       "wind": {
         "speed": 5.99,
         "deg": 144,
         "gust": 6.07
       },
       "visibility": 10000,
       "pop": 0.62,
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-07 12:00:00"
     },
     {
       "dt": 1728313200,
       "main": {
         "temp": 26.59,
         "feels_like": 26.59,
         "temp_min": 26.52,
         "temp_max": 26.59,
         "pressure": 1014,
         "sea_level": 1014,
         "grnd_level": 1013,
         "humidity": 76,
         "temp_kf": 0.07
       },
       "weather": [
         {
           "id": 802,
           "main": "Clouds",
           "description": "scattered clouds",
           "icon": "03n"
         }
       ],
       "clouds": {
         "all": 28
       },
       "wind": {
         "speed": 5.37,
         "deg": 165,
         "gust": 5.68
       },
       "visibility": 10000,
       "pop": 0.23,
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-07 15:00:00"
     },
     {
       "dt": 1728324000,
       "main": {
         "temp": 26.49,
         "feels_like": 26.49,
         "temp_min": 26.42,
         "temp_max": 26.49,
         "pressure": 1013,
         "sea_level": 1013,
         "grnd_level": 1012,
         "humidity": 78,
         "temp_kf": 0.07
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 19
       },
       "wind": {
         "speed": 4.28,
         "deg": 172,
         "gust": 4.72
       },
       "visibility": 10000,
       "pop": 0.58,
       "rain": {
         "3h": 0.69
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-07 18:00:00"
     },
     {
       "dt": 1728334800,
       "main": {
         "temp": 26.43,
         "feels_like": 26.43,
         "temp_min": 26.43,
         "temp_max": 26.43,
         "pressure": 1012,
         "sea_level": 1012,
         "grnd_level": 1012,
         "humidity": 80,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 3
       },
       "wind": {
         "speed": 4.35,
         "deg": 182,
         "gust": 4.7
       },
       "visibility": 10000,
       "pop": 0.39,
       "rain": {
         "3h": 1.01
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-07 21:00:00"
     },
     {
       "dt": 1728345600,
       "main": {
         "temp": 26.62,
         "feels_like": 26.62,
         "temp_min": 26.62,
         "temp_max": 26.62,
         "pressure": 1012,
         "sea_level": 1012,
         "grnd_level": 1012,
         "humidity": 78,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 5
       },
       "wind": {
         "speed": 4.21,
         "deg": 186,
         "gust": 4.49
       },
       "visibility": 10000,
       "pop": 0.56,
       "rain": {
         "3h": 0.6
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-08 00:00:00"
     },
     {
       "dt": 1728356400,
       "main": {
         "temp": 26.8,
         "feels_like": 29.22,
         "temp_min": 26.8,
         "temp_max": 26.8,
         "pressure": 1011,
         "sea_level": 1011,
         "grnd_level": 1011,
         "humidity": 79,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 2
       },
       "wind": {
         "speed": 4.11,
         "deg": 187,
         "gust": 4.58
       },
       "visibility": 10000,
       "pop": 0.5,
       "rain": {
         "3h": 0.11
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-08 03:00:00"
     },
     {
       "dt": 1728367200,
       "main": {
         "temp": 26.98,
         "feels_like": 29.51,
         "temp_min": 26.98,
         "temp_max": 26.98,
         "pressure": 1010,
         "sea_level": 1010,
         "grnd_level": 1010,
         "humidity": 78,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 2
       },
       "wind": {
         "speed": 4.03,
         "deg": 182,
         "gust": 4.49
       },
       "visibility": 10000,
       "pop": 0.66,
       "rain": {
         "3h": 0.33
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-08 06:00:00"
     },
     {
       "dt": 1728378000,
       "main": {
         "temp": 26.83,
         "feels_like": 29.37,
         "temp_min": 26.83,
         "temp_max": 26.83,
         "pressure": 1011,
         "sea_level": 1011,
         "grnd_level": 1011,
         "humidity": 80,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 4
       },
       "wind": {
         "speed": 3.93,
         "deg": 169,
         "gust": 4.54
       },
       "visibility": 10000,
       "pop": 0.64,
       "rain": {
         "3h": 0.13
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-08 09:00:00"
     },
     {
       "dt": 1728388800,
       "main": {
         "temp": 26.59,
         "feels_like": 26.59,
         "temp_min": 26.59,
         "temp_max": 26.59,
         "pressure": 1011,
         "sea_level": 1011,
         "grnd_level": 1011,
         "humidity": 82,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 4
       },
       "wind": {
         "speed": 4.55,
         "deg": 170,
         "gust": 5.42
       },
       "visibility": 10000,
       "pop": 0.9,
       "rain": {
         "3h": 1.59
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-08 12:00:00"
     },
     {
       "dt": 1728399600,
       "main": {
         "temp": 26.4,
         "feels_like": 26.4,
         "temp_min": 26.4,
         "temp_max": 26.4,
         "pressure": 1010,
         "sea_level": 1010,
         "grnd_level": 1010,
         "humidity": 83,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 38
       },
       "wind": {
         "speed": 4.42,
         "deg": 165,
         "gust": 5.14
       },
       "visibility": 10000,
       "pop": 1,
       "rain": {
         "3h": 1.22
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-08 15:00:00"
     },
     {
       "dt": 1728410400,
       "main": {
         "temp": 26.71,
         "feels_like": 29.11,
         "temp_min": 26.71,
         "temp_max": 26.71,
         "pressure": 1009,
         "sea_level": 1009,
         "grnd_level": 1009,
         "humidity": 80,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 50
       },
       "wind": {
         "speed": 5.34,
         "deg": 166,
         "gust": 6.05
       },
       "visibility": 10000,
       "pop": 1,
       "rain": {
         "3h": 1.93
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-08 18:00:00"
     },
     {
       "dt": 1728421200,
       "main": {
         "temp": 26.85,
         "feels_like": 29.5,
         "temp_min": 26.85,
         "temp_max": 26.85,
         "pressure": 1009,
         "sea_level": 1009,
         "grnd_level": 1009,
         "humidity": 81,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 56
       },
       "wind": {
         "speed": 6.13,
         "deg": 152,
         "gust": 6.78
       },
       "visibility": 10000,
       "pop": 0.79,
       "rain": {
         "3h": 0.74
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-08 21:00:00"
     },
     {
       "dt": 1728432000,
       "main": {
         "temp": 26.91,
         "feels_like": 29.9,
         "temp_min": 26.91,
         "temp_max": 26.91,
         "pressure": 1008,
         "sea_level": 1008,
         "grnd_level": 1008,
         "humidity": 84,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 803,
           "main": "Clouds",
           "description": "broken clouds",
           "icon": "04d"
         }
       ],
       "clouds": {
         "all": 77
       },
       "wind": {
         "speed": 7.6,
         "deg": 146,
         "gust": 8.91
       },
       "visibility": 10000,
       "pop": 0.68,
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-09 00:00:00"
     },
     {
       "dt": 1728442800,
       "main": {
         "temp": 26.63,
         "feels_like": 26.63,
         "temp_min": 26.63,
         "temp_max": 26.63,
         "pressure": 1007,
         "sea_level": 1007,
         "grnd_level": 1007,
         "humidity": 84,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 100
       },
       "wind": {
         "speed": 7.73,
         "deg": 149,
         "gust": 9.18
       },
       "visibility": 10000,
       "pop": 0.84,
       "rain": {
         "3h": 0.96
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-09 03:00:00"
     },
     {
       "dt": 1728453600,
       "main": {
         "temp": 26.18,
         "feels_like": 26.18,
         "temp_min": 26.18,
         "temp_max": 26.18,
         "pressure": 1006,
         "sea_level": 1006,
         "grnd_level": 1006,
         "humidity": 83,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 501,
           "main": "Rain",
           "description": "moderate rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 100
       },
       "wind": {
         "speed": 8.71,
         "deg": 160,
         "gust": 9.86
       },
       "visibility": 10000,
       "pop": 1,
       "rain": {
         "3h": 3.91
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-09 06:00:00"
     },
     {
       "dt": 1728464400,
       "main": {
         "temp": 25.19,
         "feels_like": 26.01,
         "temp_min": 25.19,
         "temp_max": 25.19,
         "pressure": 1007,
         "sea_level": 1007,
         "grnd_level": 1007,
         "humidity": 86,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 501,
           "main": "Rain",
           "description": "moderate rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 100
       },
       "wind": {
         "speed": 9.61,
         "deg": 134,
         "gust": 10.91
       },
       "visibility": 10000,
       "pop": 0.98,
       "rain": {
         "3h": 4.26
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-09 09:00:00"
     },
     {
       "dt": 1728475200,
       "main": {
         "temp": 24.59,
         "feels_like": 25.48,
         "temp_min": 24.59,
         "temp_max": 24.59,
         "pressure": 1006,
         "sea_level": 1006,
         "grnd_level": 1006,
         "humidity": 91,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 501,
           "main": "Rain",
           "description": "moderate rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 100
       },
       "wind": {
         "speed": 9.35,
         "deg": 105,
         "gust": 11.12
       },
       "visibility": 7259,
       "pop": 1,
       "rain": {
         "3h": 4.51
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-09 12:00:00"
     },
     {
       "dt": 1728486000,
       "main": {
         "temp": 24.61,
         "feels_like": 25.55,
         "temp_min": 24.61,
         "temp_max": 24.61,
         "pressure": 1004,
         "sea_level": 1004,
         "grnd_level": 1004,
         "humidity": 93,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 502,
           "main": "Rain",
           "description": "heavy intensity rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 100
       },
       "wind": {
         "speed": 10.31,
         "deg": 87,
         "gust": 11.44
       },
       "visibility": 3864,
       "pop": 1,
       "rain": {
         "3h": 15.52
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-09 15:00:00"
     },
     {
       "dt": 1728496800,
       "main": {
         "temp": 25.02,
         "feels_like": 25.9,
         "temp_min": 25.02,
         "temp_max": 25.02,
         "pressure": 1001,
         "sea_level": 1001,
         "grnd_level": 1001,
         "humidity": 89,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 501,
           "main": "Rain",
           "description": "moderate rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 100
       },
       "wind": {
         "speed": 10.58,
         "deg": 90,
         "gust": 12.26
       },
       "visibility": 7030,
       "pop": 1,
       "rain": {
         "3h": 10.16
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-09 18:00:00"
     },
     {
       "dt": 1728507600,
       "main": {
         "temp": 25.02,
         "feels_like": 25.98,
         "temp_min": 25.02,
         "temp_max": 25.02,
         "pressure": 999,
         "sea_level": 999,
         "grnd_level": 999,
         "humidity": 92,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 501,
           "main": "Rain",
           "description": "moderate rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 100
       },
       "wind": {
         "speed": 12.56,
         "deg": 77,
         "gust": 14.23
       },
       "visibility": 3544,
       "pop": 1,
       "rain": {
         "3h": 10.54
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-09 21:00:00"
     },
     {
       "dt": 1728518400,
       "main": {
         "temp": 25.22,
         "feels_like": 26.33,
         "temp_min": 25.22,
         "temp_max": 25.22,
         "pressure": 992,
         "sea_level": 992,
         "grnd_level": 992,
         "humidity": 97,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 503,
           "main": "Rain",
           "description": "very heavy rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 100
       },
       "wind": {
         "speed": 14.56,
         "deg": 62,
         "gust": 18.45
       },
       "visibility": 1099,
       "pop": 1,
       "rain": {
         "3h": 58.71
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-10 00:00:00"
     },
     {
       "dt": 1728529200,
       "main": {
         "temp": 26.11,
         "feels_like": 26.11,
         "temp_min": 26.11,
         "temp_max": 26.11,
         "pressure": 987,
         "sea_level": 987,
         "grnd_level": 987,
         "humidity": 93,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 503,
           "main": "Rain",
           "description": "very heavy rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 100
       },
       "wind": {
         "speed": 12.31,
         "deg": 70,
         "gust": 14.83
       },
       "visibility": 6115,
       "pop": 1,
       "rain": {
         "3h": 55.02
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-10 03:00:00"
     },
     {
       "dt": 1728540000,
       "main": {
         "temp": 25.98,
         "feels_like": 25.98,
         "temp_min": 25.98,
         "temp_max": 25.98,
         "pressure": 987,
         "sea_level": 987,
         "grnd_level": 987,
         "humidity": 94,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 502,
           "main": "Rain",
           "description": "heavy intensity rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 100
       },
       "wind": {
         "speed": 18.96,
         "deg": 353,
         "gust": 19.97
       },
       "visibility": 10000,
       "pop": 1,
       "rain": {
         "3h": 22.95
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-10 06:00:00"
     },
     {
       "dt": 1728550800,
       "main": {
         "temp": 25.6,
         "feels_like": 26.49,
         "temp_min": 25.6,
         "temp_max": 25.6,
         "pressure": 992,
         "sea_level": 992,
         "grnd_level": 992,
         "humidity": 87,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 100
       },
       "wind": {
         "speed": 19.88,
         "deg": 330,
         "gust": 23.51
       },
       "visibility": 10000,
       "pop": 0.69,
       "rain": {
         "3h": 1.02
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-10 09:00:00"
     },
     {
       "dt": 1728561600,
       "main": {
         "temp": 25.84,
         "feels_like": 26.67,
         "temp_min": 25.84,
         "temp_max": 25.84,
         "pressure": 997,
         "sea_level": 997,
         "grnd_level": 997,
         "humidity": 84,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 97
       },
       "wind": {
         "speed": 13.62,
         "deg": 315,
         "gust": 16.1
       },
       "visibility": 10000,
       "pop": 0.65,
       "rain": {
         "3h": 0.11
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-10 12:00:00"
     },
     {
       "dt": 1728572400,
       "main": {
         "temp": 26.29,
         "feels_like": 26.29,
         "temp_min": 26.29,
         "temp_max": 26.29,
         "pressure": 1000,
         "sea_level": 1000,
         "grnd_level": 1000,
         "humidity": 79,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 803,
           "main": "Clouds",
           "description": "broken clouds",
           "icon": "04n"
         }
       ],
       "clouds": {
         "all": 70
       },
       "wind": {
         "speed": 11.49,
         "deg": 305,
         "gust": 13.16
       },
       "visibility": 10000,
       "pop": 0.08,
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-10 15:00:00"
     },
     {
       "dt": 1728583200,
       "main": {
         "temp": 26.44,
         "feels_like": 26.44,
         "temp_min": 26.44,
         "temp_max": 26.44,
         "pressure": 1002,
         "sea_level": 1002,
         "grnd_level": 1002,
         "humidity": 77,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 803,
           "main": "Clouds",
           "description": "broken clouds",
           "icon": "04n"
         }
       ],
       "clouds": {
         "all": 76
       },
       "wind": {
         "speed": 9.06,
         "deg": 303,
         "gust": 10.23
       },
       "visibility": 10000,
       "pop": 0.05,
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-10 18:00:00"
     },
     {
       "dt": 1728594000,
       "main": {
         "temp": 26.39,
         "feels_like": 26.39,
         "temp_min": 26.39,
         "temp_max": 26.39,
         "pressure": 1005,
         "sea_level": 1005,
         "grnd_level": 1005,
         "humidity": 77,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "clouds": {
         "all": 2
       },
       "wind": {
         "speed": 8.05,
         "deg": 298,
         "gust": 8.94
       },
       "visibility": 10000,
       "pop": 0,
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-10 21:00:00"
     },
     {
       "dt": 1728604800,
       "main": {
         "temp": 26.49,
         "feels_like": 26.49,
         "temp_min": 26.49,
         "temp_max": 26.49,
         "pressure": 1006,
         "sea_level": 1006,
         "grnd_level": 1006,
         "humidity": 75,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 801,
           "main": "Clouds",
           "description": "few clouds",
           "icon": "02d"
         }
       ],
       "clouds": {
         "all": 13
       },
       "wind": {
         "speed": 6.79,
         "deg": 293,
         "gust": 7.48
       },
       "visibility": 10000,
       "pop": 0,
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-11 00:00:00"
     },
     {
       "dt": 1728615600,
       "main": {
         "temp": 26.72,
         "feels_like": 28.61,
         "temp_min": 26.72,
         "temp_max": 26.72,
         "pressure": 1007,
         "sea_level": 1007,
         "grnd_level": 1007,
         "humidity": 73,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 801,
           "main": "Clouds",
           "description": "few clouds",
           "icon": "02d"
         }
       ],
       "clouds": {
         "all": 20
       },
       "wind": {
         "speed": 5.77,
         "deg": 292,
         "gust": 6.35
       },
       "visibility": 10000,
       "pop": 0.02,
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-11 03:00:00"
     },
     {
       "dt": 1728626400,
       "main": {
         "temp": 26.18,
         "feels_like": 26.18,
         "temp_min": 26.18,
         "temp_max": 26.18,
         "pressure": 1008,
         "sea_level": 1008,
         "grnd_level": 1008,
         "humidity": 77,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10d"
         }
       ],
       "clouds": {
         "all": 14
       },
       "wind": {
         "speed": 5.4,
         "deg": 324,
         "gust": 5.31
       },
       "visibility": 10000,
       "pop": 0.2,
       "rain": {
         "3h": 0.11
       },
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-11 06:00:00"
     },
     {
       "dt": 1728637200,
       "main": {
         "temp": 25.69,
         "feels_like": 26.35,
         "temp_min": 25.69,
         "temp_max": 25.69,
         "pressure": 1011,
         "sea_level": 1011,
         "grnd_level": 1011,
         "humidity": 78,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 801,
           "main": "Clouds",
           "description": "few clouds",
           "icon": "02n"
         }
       ],
       "clouds": {
         "all": 17
       },
       "wind": {
         "speed": 4.27,
         "deg": 345,
         "gust": 4.16
       },
       "visibility": 10000,
       "pop": 0,
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-11 09:00:00"
     },
     {
       "dt": 1728648000,
       "main": {
         "temp": 25.42,
         "feels_like": 26.03,
         "temp_min": 25.42,
         "temp_max": 25.42,
         "pressure": 1012,
         "sea_level": 1012,
         "grnd_level": 1012,
         "humidity": 77,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 17
       },
       "wind": {
         "speed": 5.2,
         "deg": 343,
         "gust": 5
       },
       "visibility": 10000,
       "pop": 0.2,
       "rain": {
         "3h": 0.18
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-11 12:00:00"
     },
     {
       "dt": 1728658800,
       "main": {
         "temp": 25.16,
         "feels_like": 25.72,
         "temp_min": 25.16,
         "temp_max": 25.16,
         "pressure": 1013,
         "sea_level": 1013,
         "grnd_level": 1013,
         "humidity": 76,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 21
       },
       "wind": {
         "speed": 6.43,
         "deg": 344,
         "gust": 5.98
       },
       "visibility": 10000,
       "pop": 0.21,
       "rain": {
         "3h": 0.14
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-11 15:00:00"
     },
     {
       "dt": 1728669600,
       "main": {
         "temp": 24.98,
         "feels_like": 25.41,
         "temp_min": 24.98,
         "temp_max": 24.98,
         "pressure": 1014,
         "sea_level": 1014,
         "grnd_level": 1014,
         "humidity": 72,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 500,
           "main": "Rain",
           "description": "light rain",
           "icon": "10n"
         }
       ],
       "clouds": {
         "all": 24
       },
       "wind": {
         "speed": 7.48,
         "deg": 347,
         "gust": 7.14
       },
       "visibility": 10000,
       "pop": 0.2,
       "rain": {
         "3h": 0.11
       },
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-11 18:00:00"
     },
     {
       "dt": 1728680400,
       "main": {
         "temp": 24.75,
         "feels_like": 25.08,
         "temp_min": 24.75,
         "temp_max": 24.75,
         "pressure": 1016,
         "sea_level": 1016,
         "grnd_level": 1016,
         "humidity": 69,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 803,
           "main": "Clouds",
           "description": "broken clouds",
           "icon": "04d"
         }
       ],
       "clouds": {
         "all": 53
       },
       "wind": {
         "speed": 7.5,
         "deg": 358,
         "gust": 7.19
       },
       "visibility": 10000,
       "pop": 0,
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-11 21:00:00"
     },
     {
       "dt": 1728691200,
       "main": {
         "temp": 24.56,
         "feels_like": 24.85,
         "temp_min": 24.56,
         "temp_max": 24.56,
         "pressure": 1017,
         "sea_level": 1017,
         "grnd_level": 1017,
         "humidity": 68,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 803,
           "main": "Clouds",
           "description": "broken clouds",
           "icon": "04d"
         }
       ],
       "clouds": {
         "all": 67
       },
       "wind": {
         "speed": 7.68,
         "deg": 2,
         "gust": 7.3
       },
       "visibility": 10000,
       "pop": 0,
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-12 00:00:00"
     },
     {
       "dt": 1728702000,
       "main": {
         "temp": 24.47,
         "feels_like": 24.7,
         "temp_min": 24.47,
         "temp_max": 24.47,
         "pressure": 1016,
         "sea_level": 1016,
         "grnd_level": 1016,
         "humidity": 66,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 803,
           "main": "Clouds",
           "description": "broken clouds",
           "icon": "04d"
         }
       ],
       "clouds": {
         "all": 58
       },
       "wind": {
         "speed": 7.56,
         "deg": 16,
         "gust": 7.21
       },
       "visibility": 10000,
       "pop": 0,
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-12 03:00:00"
     },
     {
       "dt": 1728712800,
       "main": {
         "temp": 24.6,
         "feels_like": 24.73,
         "temp_min": 24.6,
         "temp_max": 24.6,
         "pressure": 1016,
         "sea_level": 1016,
         "grnd_level": 1016,
         "humidity": 62,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 802,
           "main": "Clouds",
           "description": "scattered clouds",
           "icon": "03d"
         }
       ],
       "clouds": {
         "all": 29
       },
       "wind": {
         "speed": 6.9,
         "deg": 28,
         "gust": 6.83
       },
       "visibility": 10000,
       "pop": 0,
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2024-10-12 06:00:00"
     },
     {
       "dt": 1728723600,
       "main": {
         "temp": 24.53,
         "feels_like": 24.74,
         "temp_min": 24.53,
         "temp_max": 24.53,
         "pressure": 1018,
         "sea_level": 1018,
         "grnd_level": 1018,
         "humidity": 65,
         "temp_kf": 0
       },
       "weather": [
         {
           "id": 802,
           "main": "Clouds",
           "description": "scattered clouds",
           "icon": "03n"
         }
       ],
       "clouds": {
         "all": 28
       },
       "wind": {
         "speed": 8.16,
         "deg": 30,
         "gust": 7.71
       },
       "visibility": 10000,
       "pop": 0,
       "sys": {
         "pod": "n"
       },
       "dt_txt": "2024-10-12 09:00:00"
     }
   ],
   "city": {
     "id": 0,
     "name": "",
     "coord": {
       "lat": 33.6913,
       "lon": 151.1502
     },
     "country": "",
     "population": 0,
     "timezone": 36000,
     "sunrise": 1728244430,
     "sunset": 1728286344
   }
 }
 */


struct ForecastWeatherData: Codable {
    let list: [ForecastList]
    //let city: City
}

struct ForecastList: Codable {
    let dt: Int
    let main: MainClass
    let weather: [ForecastWeather]
    let clouds: ForecastClouds?
    let wind: ForecastWind?
    let visibility: Int?
    let pop: Double?
    let sys: DayNight
    let rain: Rain?
    let snow: Snow?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case rain, snow
    }
}

struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

struct ForecastWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct ForecastClouds: Codable {
    let all: Int
}

struct ForecastWind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

struct DayNight: Codable {
    let pod: String
}

struct City: Codable {
    let id: Int
    let name: String
    let coord: CityCoord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

struct CityCoord: Codable {
    let lat, lon: Double
}

struct Rain: Codable {
    let rain3H: Double
    
    enum CodingKeys: String, CodingKey {
        case rain3H = "3h"
    }
}

struct Snow: Codable {
    let snow3H: Double
    
    enum CodingKeys: String, CodingKey {
        case snow3H = "3h"
    }
}

