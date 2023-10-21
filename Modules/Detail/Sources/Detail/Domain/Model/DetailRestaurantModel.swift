//
//  DetailRestaurantModel.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 04/10/23.
//

import Foundation

public struct DetailRestaurantModel: Equatable, Identifiable {
  
  public let id, name, description, city, address, pictureId: String
  public let categories: [CategoryModel]
  public let menus: MenusModel
  public let rating: Double  
}
