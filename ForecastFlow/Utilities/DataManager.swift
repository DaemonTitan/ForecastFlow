//
//  DataManager.swift
//  ForecastFlow
//
//  Created by Tony Chen on 21/11/2024.
//

import Foundation
import CoreData

class DataManager: ObservableObject {
    static let instance = DataManager()
    
    @Published var savedCities: [LocationCoordinates] = []
    @Published var alertMessage: CoreDataErrors? = .coreDataFetchError
    @Published var showAlert: Bool = false
    
    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WeatherData")
        container.loadPersistentStores { description, error in
            if let error = error {
                //print("Error loading core data: \(error)")
                self.showAlert = true
                self.alertMessage = .coreDataLoadingError
            }
        }
        return container
    }()
    private lazy var context: NSManagedObjectContext = container.viewContext
    
    init() {
        fetchData(from: "LocationCoordinates")
    }
    
    func fetchData(from entityName: String) {
        let request = NSFetchRequest<LocationCoordinates>(entityName: entityName)
        do {
            savedCities = try context.fetch(request)
        } catch {
            //print("Error fetching data: \(error.localizedDescription)")
            showAlert = true
            alertMessage = .coreDataFetchError
        }
    }

    // MARK: Save and delete city data from LocationCoordinates
    func addCityData(cityName: String, latitude: Double, longitude: Double) {
        if savedCities.contains(where: { $0.cityName == cityName }) {
            //print("Selected city \(cityName) is already saved.")
            showAlert = true
            alertMessage = .dataAlreadySaveError(cityName: cityName)
        } else {
            let data = LocationCoordinates(context: context)
            data.cityName = cityName
            data.latitude = latitude
            data.longitude = longitude
            
            do {
                try context.save()
                fetchData(from: "LocationCoordinates")
            } catch {
                //let nsError = error as NSError
                //print("Error save data: \(nsError)")
                alertMessage = .coreDataSaveError
            }
        }
    }
    
    func deleteCityData(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let data = savedCities[index]
        container.viewContext.delete(data)
        
        do {
            try context.save()
            fetchData(from: "LocationCoordinates")
        } catch {
            //let nsError = error as NSError
            //print("Error saving data: \(nsError)")
            showAlert = true
            alertMessage = .coreDataDeleteError
        }
    }
    
    // MARK: Save and delete templature data
    
}
