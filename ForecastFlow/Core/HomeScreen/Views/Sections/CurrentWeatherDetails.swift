//
//  CurrentWeatherDetails.swift
//  ForecastFlow
//
//  Created by Tony Chen on 5/10/2024.
//

import SwiftUI

struct CurrentWeatherDetails: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    var maxMinTemp: String
    var cloud: String
    var humidity: String
    var wind: String
    var sunraise: String
    var sunset: String
    
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .bottom , spacing: 25) {
                // Max/Min Temperature
                WeatherDetails(image: L10n.CurrentWeather.thermometerIcon,
                               data: "\(maxMinTemp)",
                               name: L10n.CurrentWeather.maxMinLabel)
                // Cloud
                WeatherDetails(image: L10n.CurrentWeather.cloudIcon,
                               data: "\(cloud)",
                               name: L10n.CurrentWeather.cloudLabel)
                
                // Humidity
                WeatherDetails(image: L10n.CurrentWeather.humidityIcon,
                               data: "\(humidity)",
                               name: L10n.CurrentWeather.humidityLabel)
                
                // Wind
                WeatherDetails(image: L10n.CurrentWeather.windIcon,
                               data: "\(wind)",
                               name: L10n.CurrentWeather.windLabel)
            }
            .padding(.vertical, 20)
            HStack(spacing: 25) {
                SunraiseSunSet(image: "\(L10n.CurrentWeather.sunriseIcon)",
                               time: "\(sunraise)",
                               name: "\(L10n.CurrentWeather.sunraiseLabel)")
                SunraiseSunSet(image: "\(L10n.CurrentWeather.sunsetIcon)",
                               time: "\(sunset)",
                               name: "\(L10n.CurrentWeather.sunsetLabel)")
            }
        }
        .background(
            Rectangle()
                .fill(.ultraThinMaterial.opacity(0.5))
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .frame(width: 350, height: 200)
                .offset(y: 10)
        )
    }
}

#Preview {
    CurrentWeatherDetails(maxMinTemp: "16 / 14",
                          cloud: "17%",
                          humidity: "75%",
                          wind: "3.2km/h",
                          sunraise: "07:00 am",
                          sunset: "06:20 pm")
        .preferredColorScheme(.dark)
        .environmentObject(WeatherMokeData.instance.homeVM)
}
