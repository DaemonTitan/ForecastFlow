//
//  AppResources.swift
//  ForecastFlow
//
//  Created by Tony Chen on 21/10/2024.
//

import Foundation

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


// MARK: Location Access Error
enum LocationErrors: LocalizedError {
    case locationRestrictedError
    case locationDeniedError
    case locationNotDeterminedError
    
    var errorDescription: String? {
        switch self {
        case .locationRestrictedError:
            L10n.Error.Location.restrictedDescription
        case .locationDeniedError:
            L10n.Error.Location.deniedDescription
        case .locationNotDeterminedError:
            L10n.Error.Location.notDeterminedDescription
        }
    }
        
    var failureReason: String {
        switch self {
        case .locationRestrictedError:
            L10n.Error.Location.restrictedReason
        case .locationDeniedError:
            L10n.Error.Location.deniedReason
        case .locationNotDeterminedError:
            L10n.Error.Location.notDeterminedReason
        }
    }
}
