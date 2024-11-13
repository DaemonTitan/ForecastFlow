//
//  LocationSearchView.swift
//  ForecastFlow
//
//  Created by Tony Chen on 23/10/2024.
//

import SwiftUI

struct LocationSearchView: View {
    @EnvironmentObject private var homeVM: HomeViewModel
    @StateObject var locationSearchManager = LocationSearchManager()
    @StateObject var locationSearchVM = LocationSearchViewModel()
    @State var showSheet: Bool = false
    @State var isSaveLocation: Bool = true
    
    var body: some View {
        NavigationStack {
            List(locationSearchManager.searchResult) { cityName in
                HStack {
                    VStack(alignment: .leading) {
                        Text(cityName.title)
                        Text(cityName.subtitle)
                    }
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    showSheet.toggle()
                    Task {
                        await locationSearchVM.fetchSearchResults(cityDetail: cityName)
                    }
                }
            }
            .background(Color.fogGrayColor.ignoresSafeArea())
            .listStyle(.plain)
            .navigationTitle(L10n.LocationSearch.title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    XMarkButton()
                }
            }
            .searchable(text: $locationSearchVM.queryText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: L10n.LocationSearch.searchBarText)
            .onChange(of: locationSearchVM.debounceText) { text in
                if !locationSearchVM.debounceText.isEmpty {
                    locationSearchManager.searchCity(for: text)
                } else {
                    locationSearchManager.searchResult = []
                }
            }
            .sheet(isPresented: $showSheet) {
                weatherDetailView
            }
        }
    }
}

extension LocationSearchView {
    
    var weatherDetailView: some View {
        VStack {
            topbar
            ScrollView {
                weatherTemperature
                weatherDetail
                forecastSegment
            }
        }
        .background(homeVM.backgroundColour.ignoresSafeArea())
    }
    
    var topbar: some View {
        Topbar(isSaveLocation: $isSaveLocation,
               showSheet: $showSheet,
               cityName: locationSearchVM.selectedCityCurrentWeather?.cityName ?? "",
               date: homeVM.displayCurrentDate())
    }
    
    var weatherTemperature: some View {
        CurrentWeatherAndTemperature(weatherIcon: locationSearchVM.selectedCityCurrentWeather?.weather[0].icon ?? "",
                                     temp: locationSearchVM.selectedCityCurrentWeather?.main.temp.doubleToString() ?? "",
                                     weatherName: locationSearchVM.selectedCityCurrentWeather?.weather[0].description ?? "Not Avaiable",
                                     feelsLike: locationSearchVM.selectedCityCurrentWeather?.main.feelsLike.doubleToString() ?? "")
    }
    
    var weatherDetail: some View {
        CurrentWeatherDetails(maxMinTemp: locationSearchVM.weatherData(L10n.CurrentWeather.maxMinLabel),
                              cloud: locationSearchVM.weatherData(L10n.CurrentWeather.cloudLabel),
                              humidity: locationSearchVM.weatherData(L10n.CurrentWeather.humidityLabel),
                              wind: locationSearchVM.weatherData(L10n.CurrentWeather.windLabel),
                              sunraise: locationSearchVM.weatherData(L10n.CurrentWeather.sunraiseLabel),
                              sunset: locationSearchVM.weatherData(L10n.CurrentWeather.sunsetLabel))
    }
    
    var forecastSegment: some View {
        ForecastSegment(isSaveLocation: $showSheet, forcastList: locationSearchVM.selectedCityforecastWeather)
    }
}

#Preview {
    LocationSearchView()
        .environmentObject(WeatherMokeData.instance.homeVM)
}
