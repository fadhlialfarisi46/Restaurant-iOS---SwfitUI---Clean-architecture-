//
//  RestaurantRepository.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import Foundation
import Combine

protocol RestaurantRepositoryProtocol {
  
  func getRestaurants() -> AnyPublisher<[RestaurantModel], Error>
  func getDetailRestaurant(by id: String) -> AnyPublisher<DetailRestaurantModel, Error>
  
}

final class RestaurantRepository: NSObject {
  
  typealias RestaurantInstance = (LocaleDataSource, RemoteDataSource) -> RestaurantRepository
  
  fileprivate let remote: RemoteDataSource
  fileprivate let locale: LocaleDataSource
  
  private init(locale: LocaleDataSource, remote: RemoteDataSource) {
    self.locale = locale
    self.remote = remote
  }
  
  static let sharedInstance: RestaurantInstance = { localeRepo, remoteRepo in
    return RestaurantRepository(locale: localeRepo, remote: remoteRepo)
  }
  
}

extension RestaurantRepository: RestaurantRepositoryProtocol {
  
  func getRestaurants() -> AnyPublisher<[RestaurantModel], Error> {
    return self.locale.getRestaurants()
      .flatMap{ result -> AnyPublisher<[RestaurantModel], Error> in
        if result.isEmpty {
          return self.remote.getRestaurants()
            .map { RestaurantMapper.mapRestaurantResponsesToEntities(input: $0)}
            .catch { _ in self.locale.getRestaurants()}
            .flatMap { self.locale.addRestaurants(from: $0)}
            .filter { $0 }
            .flatMap { _ in self.locale.getRestaurants()
                .map { RestaurantMapper.mapRestaurantEntitiesToDomains(input: $0)}
            }.eraseToAnyPublisher()
        } else {
          return self.locale.getRestaurants()
            .map{ RestaurantMapper.mapRestaurantEntitiesToDomains(input:$0)}
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }
  
  func getDetailRestaurant(by id: String) -> AnyPublisher<DetailRestaurantModel, Error> {
    return self.remote.getDetailRestaurant(by: id)
      .map { RestaurantMapper.mapDetailRestaurantResponseToDomains(input: $0)
      }.eraseToAnyPublisher()
  }
  
}
