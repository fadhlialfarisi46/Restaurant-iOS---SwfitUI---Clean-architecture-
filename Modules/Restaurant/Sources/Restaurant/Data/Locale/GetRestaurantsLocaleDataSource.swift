//
//  GetRestaurantsLocaleDataSource.swift
//  
//
//  Created by fadhlialfarisi on 13/10/23.
//

import Core
import Combine
import RealmSwift
import Foundation

public struct GetRestaurantsLocaleDataSource: LocaleDataSource {
  
  public typealias Request = Any
  public typealias Response = RestaurantModuleEntity
  
  private let _realm: Realm
  
  public init(realm: Realm) {
    _realm = realm
  }
  
  public func list(request: Any?) -> AnyPublisher<[RestaurantModuleEntity], Error> {
    return Future<[RestaurantModuleEntity], Error> { completion in
      let categories: Results<RestaurantModuleEntity> = {
        _realm.objects(RestaurantModuleEntity.self)
          .sorted(byKeyPath: "name", ascending: true)
      }()
      completion(.success(categories.toArray(ofType: RestaurantModuleEntity.self)))
      
    }.eraseToAnyPublisher()
  }
  
  
  public func add(entities: [RestaurantModuleEntity]) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      do {
        try _realm.write {
          for category in entities {
            _realm.add(category, update: .all)
          }
          completion(.success(true))
        }
      } catch {
        completion(.failure(DatabaseError.requestFailed))
      }
      
    }.eraseToAnyPublisher()
  }
  
  public func get(id: String) -> AnyPublisher<RestaurantModuleEntity, Error> {
    fatalError()
  }
  
  public func update(id: Int, entity: RestaurantModuleEntity) -> AnyPublisher<Bool, Error> {
    fatalError()
  }
}
