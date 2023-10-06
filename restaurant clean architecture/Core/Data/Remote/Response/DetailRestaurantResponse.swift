//
//  DetailRestaurantResponse.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 04/10/23.
//

import Foundation

// MARK: - DetailRestaurantResponse
struct DetailRestaurantByIdResponse: Decodable {
  let restaurant: DetailRestaurantResponse
}

// MARK: - Restaurant
struct DetailRestaurantResponse: Decodable {
  let id, name, description, city, address, pictureId: String
  let categories: [CategoryResponse]
  let menus: MenusResponse
  let rating: Double
  
  enum CodingKeys: String, CodingKey {
    case id, name, description, city, address, pictureId, categories, menus, rating
  }
}

// MARK: - Category
struct CategoryResponse: Decodable {
  let name: String
}

// MARK: - Menus
struct MenusResponse: Decodable {
  let foods, drinks: [CategoryResponse]
}
