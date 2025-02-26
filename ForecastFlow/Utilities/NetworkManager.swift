//
//  NetworkManager.swift
//  ForecastFlow
//
//  Created by Tony Chen on 17/9/2024.
//

import Foundation

class NetwordManager {
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetwordError.badURLResponse(url: url)
        }
        return output.data
    }

    static func downloadWeatherData(from url: URL) async throws -> Data {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return try handleURLResponse(output: (data, response), url: url)
        } catch {
            throw error
        }
    }
}
