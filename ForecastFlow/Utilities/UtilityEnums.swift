//
//  UtilityEnums.swift
//  ForecastFlow
//
//  Created by Tony Chen on 25/10/2024.
//

import Foundation

enum IconImages {
    case SunnyIcon
    case CloudyIcon
    case RainSnowIcon
    case FogIcon
    case NightWeatherIcon
    case Default
}

enum WeatherDataType {
    case MaxAndMin
    case Cloud
    case Humidity
    case Wind
}

enum OptionList: String, CaseIterable, Identifiable {
    var id: Self { self }
    case today
    case tomorrow
    case next3Days
    
    var displayName: String {
        switch self {
        case .today:
            return L10n.Day.today
        case .tomorrow:
            return L10n.Day.tomorrow
        case .next3Days:
            return L10n.Day.next3Days
        }
    }
}

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
