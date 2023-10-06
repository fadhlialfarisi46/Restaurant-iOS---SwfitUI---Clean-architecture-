//
//  RestaurantsResponse.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import Foundation

struct RestaurantsResponse: Decodable {
  let restaurants: [RestaurantResponse]
}

struct RestaurantResponse: Decodable {
  let id, name, pictureId, city: String
  let rating: Double
  
  private enum CodingKeys: String, CodingKey {
    case id, name, pictureId, city, rating
  }
}
