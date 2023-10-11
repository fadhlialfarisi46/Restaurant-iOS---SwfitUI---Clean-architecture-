//
//  APICall.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import Foundation

struct API {
  static let baseUrl = "https://restaurant-api.dicoding.dev/"
}

protocol Endpoint {
  var url: String { get }
}

enum EndPoints {
  enum Gets: Endpoint {
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
