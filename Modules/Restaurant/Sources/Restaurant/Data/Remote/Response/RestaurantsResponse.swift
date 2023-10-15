//
//  RestaurantsResponse.swift
//  
//
//  Created by fadhlialfarisi on 13/10/23.
//

import Foundation

public struct RestaurantsResponse: Decodable {
  let restaurants: [RestaurantResponse]
}

public struct RestaurantResponse: Decodable {
  let id, name, pictureId, city: String
  let rating: Double
  
  private enum CodingKeys: String, CodingKey {
    case id, name, pictureId, city, rating
  }
}
