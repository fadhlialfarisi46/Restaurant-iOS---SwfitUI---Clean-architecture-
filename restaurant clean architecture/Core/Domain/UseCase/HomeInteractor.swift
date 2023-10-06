//
//  HomeInteractor.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 03/10/23.
//

import Foundation
import Combine

protocol HomeUseCase {
  
  func getRestaurants() -> AnyPublisher<[RestaurantModel], Error>
  
}

class HomeInteractor: HomeUseCase {
  
  private let repository: RestaurantRepositoryProtocol
  
  required init(repository: RestaurantRepositoryProtocol) {
    self.repository = repository
  }
  
  func getRestaurants() -> AnyPublisher<[RestaurantModel], Error> {
    return repository.getRestaurants()
  }
  
}
