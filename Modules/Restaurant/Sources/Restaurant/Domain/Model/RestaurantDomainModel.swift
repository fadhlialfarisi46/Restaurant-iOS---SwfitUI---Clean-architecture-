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
  public var isFavorite: Bool = false
  
}
