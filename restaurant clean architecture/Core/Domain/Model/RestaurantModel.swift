//
//  RestaurantModel.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import Foundation
import Combine

struct RestaurantModel: Equatable, Identifiable {
  
  let id: String
  let name: String
  let pictureId: String
  let rating: Double
  let city: String
  
}
