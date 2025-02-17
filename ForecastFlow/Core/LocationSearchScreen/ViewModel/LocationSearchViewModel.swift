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
    @Published var backgroundColour: LinearGradient? = GradientBackgroundColours.instance.sunnyDay
    
    private var locationSearchManager = LocationSearchManager()
    private var weatherDataServices = WeatherDataServices()
    private var cancellables = Set<AnyCancellable>()
    
    private var city: String? = ""
    private var latitude: Double? = 0.0
    private var longitude: Double? = 0.0
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            //self.loadLocationSearchMockData()
            self.showBackgroundColour()
        }
        self.searchResultDebounce()
    }
    
    // MARK: Load Mock Data
    func loadLocationSearchMockData() {
        self.selectedCityCurrentWeather = WeatherMokeData.instance.selectedCityCurrentWeather
        self.selectedCityforecastWeather = WeatherMokeData.instance.selectedCityForecastWeather
        //self.selectedCityDetail = WeatherMokeData.instance.location[4]
    }
    
    // MARK: Search Bar Debounce
    func searchResultDebounce(dueTime: TimeInterval = 0.8) {
        $queryText
            .removeDuplicates()
            .debounce(for: .seconds(dueTime), scheduler: DispatchQueue.main)
            .sink { [weak self] value in
                self?.debounceText = value
            }
            .store(in: &cancellables)
    }
    
    //Repeated
    // MARK: Fetch weather data when user selected from search result
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
    
    //Repeated
    // MARK: Fetch forecasted weather data when user selected from search result/
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
    
    // MARK: Show Weather Detail Label
    func weatherDetail(_ weatherDataType: String) -> String {
        return Tools.weatherData(weatherDataType: weatherDataType, weatherData: selectedCityCurrentWeather)
    }
    
    // MARK: Show Background Colour
    func showBackgroundColour() {
        self.backgroundColour = Tools.setBackgroundColour(weatherData: selectedCityCurrentWeather)
    }
    
    // MARK: Clear Select City
    func clearSelectedCity() {
//        DispatchQueue.main.async {
//            self.selectedCity = nil
//        }
        self.searchResult = []
    }
    
    
    // MARK: Get Search Results Data
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
            
            self.city = city
            self.latitude = mapItem.placemark.coordinate.latitude
            self.longitude = mapItem.placemark.coordinate.longitude
            
            let cityDetailData = CityData(title: cityDetail.title,
                                    subtitle: cityDetail.subtitle,
                                    city: city,
                                    state: state,
                                    country: country,
                                    latitude: latitude ?? 0.0,
                                    longitude: longitude ?? 0.0)
            Task {
                await fetchLocationWeatherData(cityName: cityDetailData)
                await fetchLocationForecastWeatherData(cityName: cityDetailData)
            }
        } catch {
            print("Fetch city Detail error: \(error.localizedDescription)")
        }
    }
    
    // MARK: Save Selected City Data Into Core Data
    func saveSelectedCity() {
        DataManager.instance.addCityData(cityName: city ?? "",
                                         latitude: latitude ?? 0.0,
                                         longitude: longitude ?? 0.0)
        self.queryText = ""
    }
}
