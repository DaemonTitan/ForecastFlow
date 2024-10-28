//
//  CityData.swift
//  ForecastFlow
//
//  Created by Tony Chen on 25/10/2024.
//

import Foundation

struct CityData: Identifiable, Codable {
    var id = UUID()
    let title: String
    let subtitle: String
    let city: String
    let state: String
    let country: String
    let latitude: Double
    let longitude: Double
    
    init(id: UUID = UUID(), title: String, subtitle: String, city: String, state: String, country: String, latitude: Double, longitude: Double) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.city = city
        self.state = state
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
    }
}
