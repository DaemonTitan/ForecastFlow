//
//  UtilityEnums.swift
//  ForecastFlow
//
//  Created by Tony Chen on 25/10/2024.
//

import Foundation

enum StreetFilter: String, CaseIterable {
    case rd
    case st
    case ave
    
    var streetFilterName: String {
        switch self {
        case .rd:
            return L10n.LocationSearch.StreetFilter.road
        case .st:
            return L10n.LocationSearch.StreetFilter.street
        case .ave:
            return L10n.LocationSearch.StreetFilter.avenue
        }
    }
}
