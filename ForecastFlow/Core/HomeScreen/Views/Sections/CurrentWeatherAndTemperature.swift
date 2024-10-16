//
//  CurrentWeatherAndTemperature.swift
//  ForecastFlow
//
//  Created by Tony Chen on 3/10/2024.
//

import SwiftUI

struct CurrentWeatherAndTemperature: View {
    @EnvironmentObject var homeVM: HomeViewModel

    var body: some View {
        HStack {
            ShowWeatherIcon()
            weatherDetails
        }
        .padding()
    }
    
   @ViewBuilder
    func ShowWeatherIcon() -> some View {
        if let weatherIcon = homeVM.currentWeatherData?.weather[0] {
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
}

extension CurrentWeatherAndTemperature {
    private var weatherDetails: some View {
        VStack {
            Text("\(homeVM.currentWeatherData?.main.temp.doubleToString() ?? "0") ℃")
                .font(.system(size: 60,
                              weight: .medium,
                              design: .rounded))
            Text(homeVM.currentWeatherData?.weather[0].description ?? "Not Avaiable")
                .font(.title3)
            Text("Feels like \(homeVM.currentWeatherData?.main.feelsLike.doubleToString() ?? "0") ℃")
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
    CurrentWeatherAndTemperature()
        .preferredColorScheme(.dark)
        .environmentObject(WeatherMokeData.instance.homeVM)
}
