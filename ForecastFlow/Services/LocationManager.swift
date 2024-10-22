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
    @Published var userLocation: CLLocation?
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var locationError: LocationErrors?
    
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
        self.userLocation = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Location manager error: \(error.localizedDescription)")
    }
    
    func fetchCoordinates() -> (Double, Double) {
        requestLocation()
        guard let location = userLocation else { return (0.0, 0.0) }
        return (location.coordinate.latitude, location.coordinate.longitude)
    }
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
