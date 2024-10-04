//
//  CurrentWeatherAndTemperature.swift
//  ForecastFlow
//
//  Created by Tony Chen on 3/10/2024.
//

import SwiftUI

struct CurrentWeatherAndTemperature: View {
    let weatherData: CurrentWeatherModel
    @EnvironmentObject var homeVM: HomeViewModel

    var body: some View {
        HStack {
            ShowWeatherIcon()
            weatherDetails
        }
    }
    
   @ViewBuilder
    func ShowWeatherIcon() -> some View {
        let weatherIcon = weatherData.weather[0]
            switch homeVM.iconImage {
            case .SunnyIcon:
                SunnyImage(weatherIcon.icon)
            case .CloudyIcon:
                CloudyImage(weatherIcon.icon)
            case .RainSnowIcon:
                RainSnowImage(weatherIcon.icon)
            case .FogIcon:
                FogImage(weatherIcon.icon)
            case .NightWeatherIcon:
                NightWeatherImage(weatherIcon.icon)
            case .Default:
                DefaultIconImage(weatherIcon.icon)
            }
    }
}

extension CurrentWeatherAndTemperature {
    private var weatherDetails: some View {
        VStack {
            Text("\(weatherData.main.temp.doubleToString()) ℃")
                .font(.system(size: 60,
                              weight: .medium,
                              design: .rounded))
            Text(weatherData.weather[0].description)
                .font(.title3)
            Text("Feels like \(weatherData.main.feelsLike.doubleToString()) ℃")
                .font(.title3.bold())
        }
        .foregroundStyle(Color.whiteColor)
    }
    
    @ViewBuilder
    func SunnyImage(_ imageName: String) -> some View {
        Image(imageName)
            .resizable().scaledToFit()
            .frame(height: 150)
            .padding(.horizontal, 20)
            .shadow(color: Color.yellowColor,radius: 15)
    }
    
    @ViewBuilder
    func CloudyImage(_ imageName: String) -> some View {
        Image(imageName)
            .resizable().scaledToFit()
            .frame(height: 150)
            .shadow(radius: 20, y: 20)
    }
    
    @ViewBuilder
    func RainSnowImage(_ imageName: String) -> some View {
        Image(imageName)
            .resizable().scaledToFit()
            .frame(height: 150)
            .shadow(color: Color.grayColor, radius: 10, y: 20)
    }
    
    @ViewBuilder
    func FogImage(_ imageName: String) -> some View {
        Image(imageName)
            .resizable().scaledToFit()
            .frame(height: 150)
            .shadow(color: Color.grayColor, radius: 15, y: 20)
            .mask(
                Rectangle()
                    .blur(radius: 20)
            )
    }
    
    @ViewBuilder
    func NightWeatherImage(_ imageName: String) -> some View {
        Image(imageName)
            .resizable().scaledToFit()
            .frame(height: 150)
            .shadow(color: Color.lightGrayColor, radius: 7)
    }
    
    @ViewBuilder
    func DefaultIconImage(_ imageName: String) -> some View {
        Image(imageName)
              .resizable().scaledToFit()
              .frame(height: 150)
              .shadow(color: Color.lightGrayColor, radius: 7)
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    CurrentWeatherAndTemperature(weatherData: CurrentWeatherMokeData.instance.currentWeather)
        .preferredColorScheme(.dark)
        .environmentObject(CurrentWeatherMokeData.instance.homeVM)
        
}
