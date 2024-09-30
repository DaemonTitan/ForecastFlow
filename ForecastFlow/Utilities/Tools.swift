//
//  Tools.swift
//  ForecastFlow
//
//  Created by Tony Chen on 26/9/2024.
//

import Foundation

final class ConfigTools {
    static func getKeys() -> String {
        guard let key = Bundle.main.infoDictionary?["OpenWeather_APIkey"] as? String else {
                fatalError("Can not find key")
            }
        return key
    }
}
