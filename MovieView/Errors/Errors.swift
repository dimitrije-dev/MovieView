//
//  Errors.swift
//  BlossomMovie
//
//  Created by Dimitrije Milenkovic on 31. 10. 2025..
//

import Foundation

enum APIConfigError : Error , LocalizedError {
    
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed (underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "File not found"
        case .dataLoadingFailed(underlyingError: let error):
            return "Data loading failed: \(error.localizedDescription)"
        case .decodingFailed(underlyingError: let error):
            return "Decoding failed: \(error.localizedDescription)"
        }
    }
    
}

enum NetworkError : Error , LocalizedError {
    case badURLResponse(underlyingError : Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(underlyingError: let error):
            return "Bad URL response: \(error.localizedDescription)"
        case .missingConfig:
            return "Missing configuration"
        case .urlBuildFailed:
            return "URL build failed"
        }
    }
}
