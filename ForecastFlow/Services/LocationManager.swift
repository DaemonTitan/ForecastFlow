//
//  LocationManager.swift
//  ForecastFlow
//
//  Created by Tony Chen on 15/9/2024.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    @Published var locationCoodinates: CLLocation?
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var locationError: LocationErrors?
    @Published var currentCityName: String? = ""
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        //locationManager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.locationCoodinates = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Location manager error: \(error.localizedDescription)")
    }
    
    func fetchCoordinates() async -> (Double, Double) {
        requestLocation()
        guard let location = locationCoodinates else { return (0.0, 0.0) }
        return (location.coordinate.latitude, location.coordinate.longitude)
    }
    
    func fetchLocationName(latitude: Double, longitude: Double) async throws -> String? {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        return await withCheckedContinuation { continuation in
            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                if let placemark = placemarks?.first,
                   let city = placemark.locality {
                    continuation.resume(returning: city)
                } else if let error = error {
                    print("Error to retrieve location and city name: \(error.localizedDescription)")
                    continuation.resume(throwing: error as! Never)
                } else {
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
//    func fetchCurrentCityName() async {
//        do {
//            guard let cityName = try await fetchLocationName() else { return }
//            self.currentCityName = cityName
//        } catch {
//            print("Error to fetch current city name: \(error.localizedDescription)")
//        }
//    }
    

    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            locationStatus = .authorizedAlways
            manager.startUpdatingLocation()
            
        case .authorizedWhenInUse:
            locationStatus = .authorizedWhenInUse
            manager.startUpdatingLocation()
            
        case .notDetermined:
            locationStatus = .notDetermined
            locationError = LocationErrors.locationNotDeterminedError
            //manager.requestWhenInUseAuthorization()
            print("Error: \(LocationErrors.locationNotDeterminedError.errorDescription ?? "Not determined")")
            
        case .restricted:
            locationStatus = .restricted
            locationError = LocationErrors.locationRestrictedError
            print("Error: \(LocationErrors.locationRestrictedError.errorDescription ?? "Parent control setting disallow location data")")
            
        case .denied:
            locationStatus = .denied
            locationError = LocationErrors.locationDeniedError
            print("Error: \(LocationErrors.locationDeniedError.errorDescription ?? "Disallow tapped on the permission dialog")")
        
        @unknown default:
            print("Unknow authorization status")
        }
    }
}
