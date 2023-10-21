//
//  UpdateFavoriteRestaurantLocalDataSource.swift
//  
//
//  Created by fadhlialfarisi on 18/10/23.
//

import Core
import Combine
import RealmSwift
import Restaurant

public struct UpdateFavoriteRestaurantLocalDataSource : LocaleDataSource {
  
  public typealias Request = String
  public typealias Response = RestaurantModuleEntity
  private let realm: Realm
  
  public init(realm: Realm) {
    self.realm = realm
  }
  
  public func list(request: String?) -> AnyPublisher<[RestaurantModuleEntity], Error> {    
    return Future<[RestaurantModuleEntity], Error> { completion in
      let restaurantEntities = {
        realm.objects(RestaurantModuleEntity.self)
          .filter("isFavorite = \(true)")
          .sorted(byKeyPath: "name", ascending: true)
      }()
      completion(.success(restaurantEntities.toArray(ofType: RestaurantModuleEntity.self)))
      
    }.eraseToAnyPublisher()
  }
  
  public func add(entities: [RestaurantModuleEntity]) -> AnyPublisher<Bool, Error> {fatalError()}
  
  public func get(id: String) -> AnyPublisher<RestaurantModuleEntity, Error> {
    
    return Future<RestaurantModuleEntity, Error> { completion in
      if let restaurantEntity = {
        self.realm.objects(RestaurantModuleEntity.self).filter("id = '\(id)'")
      }().first {
        do {
          try self.realm.write {
            restaurantEntity.setValue(!restaurantEntity.isFavorite, forKey: "isFavorite")
          }
          completion(.success(restaurantEntity))
        } catch {
          completion(.failure(DatabaseError.requestFailed))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  public func update(id: Int, entity: RestaurantModuleEntity) -> AnyPublisher<Bool, Error> {fatalError()}
  
}
