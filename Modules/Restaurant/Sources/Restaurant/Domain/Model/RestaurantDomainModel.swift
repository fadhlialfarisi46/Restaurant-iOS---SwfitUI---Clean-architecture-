//
//  RestaurantDomainModel.swift
//  
//
//  Created by fadhlialfarisi on 13/10/23.
//

import Foundation

public struct RestaurantDomainModel: Equatable, Identifiable {
  
  public let id: String
  public let name: String
  public let pictureId: String
  public let rating: Double
  public let city: String
  public var isFavorite: Bool
 
  public init(id: String, name: String, pictureId: String, rating: Double, city: String, isFavorite: Bool) {
    self.id = id
    self.name = name
    self.pictureId = pictureId
    self.rating = rating
    self.city = city
    self.isFavorite = isFavorite
  }
}
