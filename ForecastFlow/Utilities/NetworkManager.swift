//
//  NetworkManager.swift
//  ForecastFlow
//
//  Created by Tony Chen on 17/9/2024.
//

import Foundation

class NetwordManager {
    
    enum NetwordError: Error {
        case badURLResponse(url: URL)
        case decodingError
        case timeOut
            
        var errorDescription: String? {
            switch self{
            case .badURLResponse(url: let url):
                return "Bad response from URL: \(url)"
            case .decodingError:
                return "Data decoding error."
            case .timeOut:
                return "Network timeout"
            }
        }
    }
    
//    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
//        guard let response = output.response as? HTTPURLResponse,
//              response.statusCode >= 200 && response.statusCode < 300 else {
//            throw NetwordError.badURLResponse(url: url)
//        }
//        return output.data
//    }
//
//    func fetachWeatherData(url: URL) async throws -> Data {
//        do {
//            let (data, response) = try await URLSession.shared.data(from: url)
//            return try NetwordServices.handleURLResponse(output: (data, response), url: url)
//        } catch {
//            throw error
//        }
//    }
    
    
    static func downloadWeatherData(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetwordError.badURLResponse(url: url)
        }
        return data
    }
}
