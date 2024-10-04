//
//  CurrentWeatherAndTemperature.swift
//  ForecastFlow
//
//  Created by Tony Chen on 3/10/2024.
//

import SwiftUI

struct CurrentWeatherAndTemperature: View {
    var weatherIcon: String
    var templature: Int
    var weatherName: String
    var feelsLike: Int
    
    var body: some View {
        HStack {
            displayWeatherIcon()
            weatherDetails
        }
    }
    
    @ViewBuilder
    func displayWeatherIcon() -> some View {
        let imageIcon = Image(weatherIcon).resizable().scaledToFit()
        
        switch weatherIcon {
        case "01d":
            imageIcon
                .frame(height: 150)
                .padding(.horizontal, 20)
                .shadow(color: Color.yellowColor,radius: 15)
        case "02d":
            imageIcon
                .frame(height: 150)
                .shadow(radius: 20, y: 20)
        case "03d", "04d", "09d", "10d", "11d", "13d":
            imageIcon
                .frame(height: 150)
                .shadow(color: Color.grayColor, radius: 10, y: 20)
        case "50d", "50n":
            imageIcon
                .frame(height: 150)
                .shadow(color: Color.grayColor, radius: 15, y: 20)
                .mask(
                    Rectangle()
                        .blur(radius: 20)
                )
        case "01n", "02n", "03n", "04n", "09n", "10n", "11n", "13n":
            imageIcon
                .frame(height: 150)
                .shadow(color: Color.lightGrayColor, radius: 7)
        default:
            imageIcon
                .frame(height: 150)
                .shadow(radius: 20, y: 20)
        }
    }
}

extension CurrentWeatherAndTemperature {
    private var weatherDetails: some View {
        VStack {
            Text("\(templature) ℃")
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
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    CurrentWeatherAndTemperature(weatherIcon: "01d",
                                 templature: 21,
                                 weatherName: "Cloud",
                                 feelsLike: 24)
        .preferredColorScheme(.dark)
}
