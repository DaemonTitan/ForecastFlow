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
    @Published var selectedCity: CityData? = nil
    @Published var searchResult: [CityData] = []
    
    private var homeVM = HomeViewModel()
    private var locationSearchManager = LocationSearchManager()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
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
    
    func clearSelectedCity() {
//        DispatchQueue.main.async {
//            self.selectedCity = nil
//        }
        self.selectedCity = nil
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
            searchResult.append(cityData)
            
        } catch {
            print("Fetch city Detail error: \(error.localizedDescription)")
        }
    }
}
