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
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
            
        case .notDetermined:
            //manager.requestWhenInUseAuthorization()
            print("Not determined")
            
        case .restricted:
            print("Parent control setting disallow location data")
            
        case .denied:
            print("User tap disallow on the permission dialog")
        
        @unknown default:
            print("Unknow authorization status")
        }
    }
}
