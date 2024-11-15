//
//  CurrentWeatherView.swift
//  ForecastFlow
//
//  Created by Tony Chen on 23/10/2024.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var body: some View {

        ZStack {
            TrapezoidShape(point1: CGPoint(x: 40, y: 160),
                                        point2: CGPoint(x: 360, y: 160),
                                        point3: CGPoint(x: 360, y: -30),
                                        point4: CGPoint(x: 40, y: 50),
                                       radius: 40,
                           color: homeVM.backgroundColour)
            .frame(width: 400, height: 150)
            HStack {
                CityDetail
                cityTemperature
            }
        }
    }
}

extension CurrentWeatherView {
    var CityDetail: some View {
        VStack(alignment: .center) {
            Image("\(homeVM.currentWeatherData?.weather[0].icon ?? "")")
                .resizable()
                .scaledToFit()
                .frame(height: 90)
            Text("\(homeVM.currentWeatherData?.name ?? "")")
                .font(.system(size: 25))
                .foregroundStyle(Color.whiteColor)
                .padding(.vertical, 2)
            Text("\(homeVM.displayCurrentDate)")
                .font(.system(size: 18))
                .foregroundStyle(Color.whiteColor)
            Text("time")
        }
        .offset(y: -20)
        .padding()
    }
    
    var cityTemperature: some View {
        VStack (alignment: .center) {
            Text("\(homeVM.currentWeatherData?.main.temp.doubleToString() ?? "")\(L10n.degree)")
                .font(.system(size: 50, weight: .medium, design: .rounded))
            HStack {
                Text("\(homeVM.currentWeatherData?.main.tempMax.doubleToString() ?? "")\(L10n.degree) —")
                Text("\(homeVM.currentWeatherData?.main.tempMin.doubleToString() ?? "")\(L10n.degree)")
            }
            .font(.system(size: 18))
            Text("\(homeVM.currentWeatherData?.weather[0].main ?? "")")
        }
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    CurrentWeatherView()
        .preferredColorScheme(.dark)
        .environmentObject(WeatherMokeData.instance.homeVM)
        .padding()
}
