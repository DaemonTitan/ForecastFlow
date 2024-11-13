//
//  CurrentWeatherAndTemperature.swift
//  ForecastFlow
//
//  Created by Tony Chen on 3/10/2024.
//

import SwiftUI

struct CurrentWeatherAndTemperature: View {
    @EnvironmentObject var homeVM: HomeViewModel
    var weatherIcon: String
    var temp: String
    var weatherName: String
    var feelsLike: String

    var body: some View {
        HStack {
            ShowWeatherIcon()
            weatherDetails
        }
        .padding()
    }
    
   @ViewBuilder
    func ShowWeatherIcon() -> some View {
        switch homeVM.iconImage {
        case .SunnyIcon:
            SunnyImage(weatherIcon)
        case .CloudyIcon:
            CloudyImage(weatherIcon)
        case .RainSnowIcon:
            RainSnowImage(weatherIcon)
        case .FogIcon:
            FogImage(weatherIcon)
        case .NightWeatherIcon:
            NightWeatherImage(weatherIcon)
        case .Default:
            DefaultIconImage(weatherIcon)
        }
    }
}

extension CurrentWeatherAndTemperature {
    private var weatherDetails: some View {
        VStack {
            Text("\(temp) ℃")
                .font(.system(size: 60,
                              weight: .medium,
                              design: .rounded))
            Text(weatherName)
                .font(.title3)
            Text("Feels like \(feelsLike) ℃")
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
    CurrentWeatherAndTemperature(weatherIcon: "01d", temp: "15 °C", weatherName: "Sunny", feelsLike: "Feels Like 15 °C")
        .preferredColorScheme(.dark)
        .environmentObject(WeatherMokeData.instance.homeVM)
}
