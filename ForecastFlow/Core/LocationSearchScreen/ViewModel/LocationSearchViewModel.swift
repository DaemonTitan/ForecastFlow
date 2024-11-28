//
//  LocationSearchViewModel.swift
//  ForecastFlow
//
//  Created by Tony Chen on 24/10/2024.
//

import Foundation
import Combine
import MapKit
import SwiftUI

@MainActor
class LocationSearchViewModel: ObservableObject {
    @Published var queryText = ""
    @Published var debounceText = ""
    @Published var searchResult: [CityData] = []
    @Published var selectedCityCurrentWeather: CurrentWeatherModel? = nil
    @Published var selectedCityforecastWeather: [ForecastList] = []
    @Published var selectedCityDetail: CityData? = nil
    @Published var backgroundColour: LinearGradient? = GradientBackgroundColours.instance.sunnyDay
    
    private var homeVM = HomeViewModel()
    private var locationSearchManager = LocationSearchManager()
    private var weatherDataServices = WeatherDataServices()
    private var cancellables = Set<AnyCancellable>()
    
    private var latitude: Double? = 0.0
    private var longitude: Double? = 0.0
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.selectedCityCurrentWeather = WeatherMokeData.instance.selectedCityCurrentWeather
            self.selectedCityforecastWeather = WeatherMokeData.instance.selectedCityForecastWeather
            self.selectedCityDetail = WeatherMokeData.instance.location[4]
            self.showBackgroundColour()
        }
        self.searchResultDebounce()
    }
    
    func searchResultDebounce(dueTime: TimeInterval = 0.8) {
        $queryText
            .removeDuplicates()
            .debounce(for: .seconds(dueTime), scheduler: DispatchQueue.main)
            .sink { [weak self] value in
                self?.debounceText = value
            }
            .store(in: &cancellables)
    }
    
    func fetchLocationWeatherData(cityName: CityData) async {
        do {
            self.selectedCityCurrentWeather = try await weatherDataServices.decodeCurrentWeatherData(
                lat: cityName.latitude,
                lon: cityName.longitude,
                units: "metric",
                apiKey: ConfigTools.getKeys(),
                locationName: cityName.city)
        } catch {
            print("Fetch selected location current weather error: \(error.localizedDescription)")
        }
    }
    
    func fetchLocationForecastWeatherData(cityName: CityData) async {
        do {
            self.selectedCityforecastWeather = try await weatherDataServices.decodeForecastWeatherData(
                lat: cityName.latitude,
                lon: cityName.longitude,
                units: "metric",
                apiKey: ConfigTools.getKeys())
        } catch {
            print("Fetch selected location forecast weather data error: \(error.localizedDescription)")
        }
    }
    
    func weatherDetail(_ weatherDataType: String) -> String {
        return Tools.weatherData(weatherDataType: weatherDataType, weatherData: selectedCityCurrentWeather)
    }
    
    func showBackgroundColour() {
        self.backgroundColour = Tools.setBackgroundColour(weatherData: selectedCityCurrentWeather)
    }
    
    func clearSelectedCity() {
//        DispatchQueue.main.async {
//            self.selectedCity = nil
//        }
        self.searchResult = []
    }
    
    func fetchSearchResults(cityDetail: CityData) async {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = cityDetail.title
        let search = MKLocalSearch(request: searchRequest)
        
        do {
            let response = try await search.start()
            guard let mapItem = response.mapItems.first else { return }
            
            guard let city = mapItem.placemark.locality,
                  let state = mapItem.placemark.administrativeArea,
                  let country = mapItem.placemark.country else { return }
            
            self.latitude = mapItem.placemark.coordinate.latitude
            self.longitude = mapItem.placemark.coordinate.longitude
            
            self.selectedCityDetail = CityData(title: cityDetail.title,
                                    subtitle: cityDetail.subtitle,
                                    city: city,
                                    state: state,
                                    country: country,
                                    latitude: latitude ?? 0.0,
                                    longitude: longitude ?? 0.0)

            //await fetchLocationWeatherData(cityName: cityData)
            //await fetchLocationForecastWeatherData(cityName: cityData)
        } catch {
            print("Fetch city Detail error: \(error.localizedDescription)")
        }
    }
    
    func saveSelectedCity() {
        DataManager.instance.addCityData(cityName: selectedCityDetail?.title ?? "",
                                           latitude: self.selectedCityDetail?.latitude ?? 0.0,
                                           longitude: self.selectedCityDetail?.longitude ?? 0.0)
        self.queryText = ""
    }
}
