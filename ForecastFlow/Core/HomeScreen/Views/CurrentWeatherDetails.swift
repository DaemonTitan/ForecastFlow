//
//  CurrentWeatherDetails.swift
//  ForecastFlow
//
//  Created by Tony Chen on 5/10/2024.
//

import SwiftUI

struct CurrentWeatherDetails: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .bottom , spacing: 25) {
                // Max/Min Temperature
                WeatherDetails(image: L10n.CurrentWeather.thermometerIcon,
                               data: "\(homeVM.weatherData(L10n.CurrentWeather.maxMinLabel))",
                               name: L10n.CurrentWeather.maxMinLabel)
                // Cloud
                WeatherDetails(image: L10n.CurrentWeather.cloudIcon,
                               data: "\(homeVM.weatherData(L10n.CurrentWeather.cloudLabel))",
                               name: L10n.CurrentWeather.cloudLabel)
                
                // Humidity
                WeatherDetails(image: L10n.CurrentWeather.humidityIcon,
                               data: "\(homeVM.weatherData(L10n.CurrentWeather.humidityLabel))",
                               name: L10n.CurrentWeather.humidityLabel)
                
                // Wind
                WeatherDetails(image: L10n.CurrentWeather.windIcon,
                               data: "\(homeVM.weatherData(L10n.CurrentWeather.windLabel))",
                               name: L10n.CurrentWeather.windLabel)
            }
            .padding(.vertical, 20)
            HStack(spacing: 25) {
                SunraiseSunSet(image: "\(L10n.CurrentWeather.sunriseIcon)",
                               time: "",
                               name: "\(L10n.CurrentWeather.sunraiseLabel)")
                SunraiseSunSet(image: "\(L10n.CurrentWeather.sunsetIcon)",
                               time: "",
                               name: "\(L10n.CurrentWeather.sunsetLabel)")
            }
        }
        .background(
            Rectangle()
                .fill(.ultraThinMaterial.opacity(0.5))
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .frame(width: 360, height: 200)
                .offset(y: 10)
        )
    }
}

#Preview {
    CurrentWeatherDetails()
        .preferredColorScheme(.dark)
        .environmentObject(CurrentWeatherMokeData.instance.homeVM)
}
