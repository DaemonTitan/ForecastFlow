//
//  AppResources.swift
//  ForecastFlow
//
//  Created by Tony Chen on 21/10/2024.
//

import Foundation

// MARK: Error messages
protocol CustomErrorMessages {
    var title: String { get }
    var subtitle: String { get }
}

// MARK: Network and Decoding Error
enum NetwordError: Error {
    case badURLResponse(url: URL)
    case decodingError
    case timeOut
    case unexpectedError(Error)
    case noInternetConnection
        
    var errorDescription: String? {
        switch self{
        case .badURLResponse(url: let url):
            return "Bad response from URL: \(url)"
        case .decodingError:
            return "Data decoding error."
        case .timeOut:
            return "Network timeout."
        case .unexpectedError(let error):
            return "Unexpected error: \(error.localizedDescription)."
        case .noInternetConnection:
            return "No internet connection."
        }
    }
}


// MARK: Location Access Errors
enum LocationErrors: LocalizedError, CustomErrorMessages {
    case locationRestrictedError
    case locationDeniedError
    case locationNotDeterminedError
    
    var title: String {
        switch self {
        case .locationRestrictedError:
            L10n.Error.Location.restrictedDescription
        case .locationDeniedError:
            L10n.Error.Location.deniedDescription
        case .locationNotDeterminedError:
            L10n.Error.Location.notDeterminedDescription
        }
    }
        
    var subtitle: String {
        switch self {
        case .locationRestrictedError:
            L10n.Error.Location.restrictedReason
        case .locationDeniedError:
            L10n.Error.Location.deniedReason
        case .locationNotDeterminedError:
            L10n.Error.Location.notDeterminedReason
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .locationRestrictedError:
            L10n.Error.Location.notDeterminedDescription
        case .locationDeniedError:
            L10n.Error.Location.notDeterminedDescription
        case .locationNotDeterminedError:
            L10n.Error.Location.notDeterminedDescription
        }
    }
}

// MARK: Core Data Errors
enum CoreDataErrors: LocalizedError, CustomErrorMessages {
    case coreDataLoadingError
    case coreDataSaveError
    case coreDataDeleteError
    case coreDataFetchError
    case dataAlreadySaveError(cityName: String)
    
    var title: String {
        switch self {
        case .coreDataLoadingError:
            L10n.Error.CoreData.loadCoreDataDescription
        case .coreDataSaveError:
            L10n.Error.CoreData.saveDescription
        case .coreDataDeleteError:
            L10n.Error.CoreData.deleteDescription
        case .coreDataFetchError:
            L10n.Error.CoreData.fetchDescription
        case .dataAlreadySaveError:
            L10n.Error.CoreData.alreadySavedDescription
        }
    }
    
    var subtitle: String {
        switch self {
        case .coreDataLoadingError:
            L10n.Error.CoreData.loadCoreDataReason
        case .coreDataSaveError:
            L10n.Error.CoreData.saveReason
        case .coreDataDeleteError:
            L10n.Error.CoreData.deleteReason
        case .coreDataFetchError:
            L10n.Error.CoreData.fetchReason
        case .dataAlreadySaveError(let cityName):
            L10n.Error.CoreData.alreadySavedReason(cityName)
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .coreDataLoadingError:
            L10n.Error.CoreData.loadCoreDataDescription
        case .coreDataSaveError:
            L10n.Error.CoreData.saveDescription
        case .coreDataDeleteError:
            L10n.Error.CoreData.deleteDescription
        case .coreDataFetchError:
            L10n.Error.CoreData.fetchDescription
        case .dataAlreadySaveError:
            L10n.Error.CoreData.alreadySavedDescription
        }
    }
}
