//
//  LocationSearchManager.swift
//  ForecastFlow
//
//  Created by Tony Chen on 25/10/2024.
//

import Foundation
import MapKit

class LocationSearchManager: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    private let searchCompleter = MKLocalSearchCompleter()
    @Published var searchResult: [CityData] = []
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.resultTypes = .address
    }
    
    func searchCity(for query: String) {
        searchCompleter.queryFragment = query
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResult.removeAll()
        DispatchQueue.main.async {
            self.searchResult = completer.results
                .filter({ results in
                    let street = StreetFilter.allCases.map { $0.rawValue.capitalized }
                    return !street.contains { keyword in
                        results.title.contains(keyword)
                    }
                })
                .map({ result in
                    CityData(title: result.title, subtitle: result.subtitle, city: "", state: "", country: "", latitude: 0.0, longitude: 0.0)
                })
        }
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: any Error) {
        print("Search completed failed with error: \(error.localizedDescription)" )
    }
}
