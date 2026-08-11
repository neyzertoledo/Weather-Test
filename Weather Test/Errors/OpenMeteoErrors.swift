//
//  OpenMeteoErrors.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

enum OpenMeteoError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidDecoding
}

enum NetworkError: Error, LocalizedError {
    case badURLResponse(underliyingError: Error)
    case missingConfig
    case urlBuildFailed

    var  errorDescription: String? {
        switch self {
        case .badURLResponse(underliyingError: let error):
            return "Bad URL response: \(error.localizedDescription)"
        case .missingConfig:
            return "Missing config"
        case .urlBuildFailed:
            return "Failed to build URL"
        }
    }
}

enum LocationError: Error, LocalizedError {
    case permissionDenied
    case unavailable

    var errorDescription: String? {
        switch self {
        case .permissionDenied:
            return "Without location permission"
        case .unavailable:
            return "Location unavailable"
        }
    }
}
