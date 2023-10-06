//
//  DetailRestaurantModel.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 04/10/23.
//

import Foundation

struct DetailRestaurantModel: Equatable, Identifiable {
  
  let id, name, description, city, address, pictureId: String
  let categories: [CategoryModel]
  let menus: MenusModel
  let rating: Double  
}
