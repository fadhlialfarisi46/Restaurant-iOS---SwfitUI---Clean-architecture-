//
//  DetailInteractor.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 04/10/23.
//

import Foundation
import Combine

protocol DetailUseCase {
  
  func getDetailRestaurant() -> AnyPublisher<DetailRestaurantModel, Error>
  func updateFavoriteRestaurant() -> AnyPublisher<RestaurantModel, Error>
  func getRestaurant() -> RestaurantModel
  
}

class DetailInteractor: DetailUseCase {
  
  private let repository: RestaurantRepositoryProtocol
  private let restaurant: RestaurantModel
  
  required init(
    repository: RestaurantRepositoryProtocol,
    restaurant: RestaurantModel
  ) {
    self.repository = repository
    self.restaurant = restaurant
  }
  
  func getDetailRestaurant() -> AnyPublisher<DetailRestaurantModel, Error> {
    return repository.getDetailRestaurant(by: restaurant.id)
  }
  
  func updateFavoriteRestaurant() -> AnyPublisher<RestaurantModel, Error> {
    return repository.updateFavoriteRestaurant(by: restaurant.id)
  }
  
  func getRestaurant() -> RestaurantModel {
    return restaurant
  }
  
}
