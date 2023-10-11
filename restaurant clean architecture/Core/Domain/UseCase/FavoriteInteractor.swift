//
//  FavoriteInteractor.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 06/10/23.
//

import Foundation
import Combine

protocol FavoriteUseCase {
  
  func getFavoriteRestaurant() -> AnyPublisher<[RestaurantModel], Error>
  
}

class FavoriteInteractor: FavoriteUseCase {
  
  private let repository: RestaurantRepositoryProtocol
  
  required init(repository: RestaurantRepositoryProtocol) {
    self.repository = repository
  }
  
  func getFavoriteRestaurant() -> AnyPublisher<[RestaurantModel], Error> {
    return repository.getFavoriteRestaurants()
  }
  
}
