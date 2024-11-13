//
//  LocationSearchViewModel.swift
//  ForecastFlow
//
//  Created by Tony Chen on 24/10/2024.
//

import Foundation
import Combine
import MapKit

@MainActor
class LocationSearchViewModel: ObservableObject {
    @Published var queryText = ""
    @Published var debounceText = ""
    @Published var searchResult: [CityData] = []
    @Published var selectedCityCurrentWeather: CurrentWeatherModel? = nil
    @Published var selectedCityforecastWeather: [ForecastList] = []
    
    private var homeVM = HomeViewModel()
    private var locationSearchManager = LocationSearchManager()
    private var weatherDataServices = WeatherDataServices()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.selectedCityCurrentWeather = WeatherMokeData.instance.selectedCityCurrentWeather
            self.selectedCityforecastWeather = WeatherMokeData.instance.selectedCityForecastWeather
        }
        
        searchResultDebounce()
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
    
    func weatherData(_ weatherDataType: String) -> String {
        switch weatherDataType {
            // Max/Min Temperature
        case "Max/Min":
            return "\(selectedCityCurrentWeather?.main.tempMax.doubleToString() ?? "")\(L10n.degree)/\(selectedCityCurrentWeather?.main.tempMin.doubleToString() ?? "")\(L10n.degree)"
            // Cloud
        case "Cloud":
            return "\(selectedCityCurrentWeather?.clouds?.all?.intToString() ?? "")\(L10n.percentage)"
            // Humidity
        case "Humidity":
            return "\(selectedCityCurrentWeather?.main.humidity.intToString() ?? "")\(L10n.percentage)"
            // Wind
        case "Wind":
            return "\(selectedCityCurrentWeather?.windSpeedKmh ?? "")\(L10n.kilometresPerHour)"
        case "Sunraise":
            return "\(selectedCityCurrentWeather?.sys.sunrise.unixTimeConverter(L10n.DateFormat.sunRiseSetTimeFormat) ?? "")"
        case "Sunset":
            return "\(selectedCityCurrentWeather?.sys.sunset.unixTimeConverter(L10n.DateFormat.sunRiseSetTimeFormat) ?? "")"
        default:
            return "\(L10n.notAvailable)"
        }
    }
    
    func clearSelectedCity() {
//        DispatchQueue.main.async {
//            self.selectedCity = nil
//        }
        self.searchResult = []
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
            print("Fetch current weather error: \(error.localizedDescription)")
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
            print("Fetch forecast weather data error: \(error.localizedDescription)")
        }
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
            
            let latitude = mapItem.placemark.coordinate.latitude
            let longitude = mapItem.placemark.coordinate.longitude
            
            let cityData = CityData(title: cityDetail.title,
                                    subtitle: cityDetail.subtitle,
                                    city: city,
                                    state: state,
                                    country: country,
                                    latitude: latitude,
                                    longitude: longitude)

            //await fetchLocationWeatherData(cityName: cityData)
            //await fetchLocationForecastWeatherData(cityName: cityData)
        } catch {
            print("Fetch city Detail error: \(error.localizedDescription)")
        }
    }
}
