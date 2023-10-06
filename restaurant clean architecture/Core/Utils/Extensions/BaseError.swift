//
//  BaseError.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 03/10/23.
//

import Foundation

enum URLError: LocalizedError {
  case invalidResponse
  case addressUnreachable(URL)
  
  var errorDescription: String? {
    switch self {
      case .invalidResponse: return "The response is invalid."
      case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
    }
  }
}

enum DatabaseError: LocalizedError {
  case invalidInstance
  case requestFailed
  
  var errorDescription: String? {
    switch self {
      case .invalidInstance:
        return "Database instance is invalid"
      case .requestFailed:
        return "Your request database is failed"
    }
  }
}
