//
//  APICall.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import Foundation

public struct API {
  static let baseUrl = "https://restaurant-api.dicoding.dev/"
}

public protocol Endpoint {
  var url: String { get }
}

public enum EndPoints {
  public enum Gets: Endpoint {
    case restaurants
    case detailRestaurant
    
    public var url: String {
      switch self {
        case .restaurants: return "\(API.baseUrl)list"
        case .detailRestaurant: return "\(API.baseUrl)detail/"
      }
    }
  }
}
