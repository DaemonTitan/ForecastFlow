//
//  HomeView.swift
//  ForecastFlow
//
//  Created by Tony Chen on 30/9/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var homeVM: HomeViewModel
    @StateObject private var locationVM = LocationSearchViewModel()
    @State var isSaveLocation: Bool = false
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            topbar
            ScrollView {
                weatherTemperature
                weatherDetails
                forecastSegment
            }
        }
        .background(homeVM.backgroundColour.ignoresSafeArea())
        .onAppear {
            Task {
                //await homeVM.fetchCurrentWeatherData()
            }
        }
    }
}

extension HomeView {
    var topbar: some View {
        Topbar(isSaveLocation: $isSaveLocation,
               showSheet: $showSheet,
               cityName: homeVM.currentWeatherData?.cityName ?? "",
               date: homeVM.displayCurrentDate)
    }
    
    var weatherTemperature: some View {
        CurrentWeatherAndTemperature(weatherIcon: homeVM.currentWeatherData?.weather[0].icon ?? "",
                                     temp: homeVM.currentWeatherData?.main.temp.doubleToString() ?? "0",
                                     weatherName: homeVM.currentWeatherData?.weather[0].description ?? "Not Avaiable",
                                     feelsLike: homeVM.currentWeatherData?.main.feelsLike.doubleToString() ?? "0")
    }
    
    var weatherDetails: some View {
        CurrentWeatherDetails(maxMinTemp: homeVM.weatherDetail(L10n.CurrentWeather.maxMinLabel),
                              cloud: homeVM.weatherDetail(L10n.CurrentWeather.cloudLabel),
                              humidity: homeVM.weatherDetail(L10n.CurrentWeather.humidityLabel),
                              wind: homeVM.weatherDetail(L10n.CurrentWeather.windLabel),
                              sunraise: homeVM.weatherDetail(L10n.CurrentWeather.sunraiseLabel),
                              sunset: homeVM.weatherDetail(L10n.CurrentWeather.sunsetLabel))
    }
    
    var forecastSegment: some View {
        ForecastSegment(isSaveLocation: $showSheet ,forcastList: homeVM.filteredDailyForecast)
    }
    
}

#Preview {
    HomeView()
        .environmentObject(WeatherMokeData.instance.homeVM)
}
