//
//  DetailRestaurantResponse.swift
//
//
//  Created by fadhlialfarisi on 14/10/23.
//

import Foundation

// MARK: - DetailRestaurantResponse
public struct DetailRestaurantByIdResponse: Decodable {
  let restaurant: DetailRestaurantResponse
}

// MARK: - Restaurant
public struct DetailRestaurantResponse: Decodable {
  let id, name, description, city, address, pictureId: String
  let categories: [CategoryResponse]
  let menus: MenusResponse
  let rating: Double
  
  enum CodingKeys: String, CodingKey {
    case id, name, description, city, address, pictureId, categories, menus, rating
  }
}

// MARK: - Category
public struct CategoryResponse: Decodable {
  let name: String
}

// MARK: - Menus
public struct MenusResponse: Decodable {
  let foods, drinks: [CategoryResponse]
}
