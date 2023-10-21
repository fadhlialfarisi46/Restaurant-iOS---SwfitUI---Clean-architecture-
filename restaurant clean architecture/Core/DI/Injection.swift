//
//  Injection.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import Foundation
import RealmSwift
import Core
import Restaurant
import UIKit
import Favorite
import Detail

final class Injection: NSObject {
  
  private let realm = try? Realm()
  
  func provideHome<U: UseCase>() -> U where U.Request == Any, U.Response == [RestaurantDomainModel] {
    
    let locale = GetRestaurantsLocaleDataSource(realm: realm!)
    
    let remote = GetRestaurantsRemoteDataSource(endpoint: EndPoints.Gets.restaurants.url)
    
    let mapper = RestaurantTransformer()
    
    let repository = GetRestaurantsRepository(localeDataSource: locale, remoteDataSource: remote, mapper: mapper)
    
    return Interactor(repository: repository) as! U
    
  }
  
  func provideFavorite<U: UseCase>() -> U where U.Request == String, U.Response == [RestaurantDomainModel] {
    
    let locale = GetFavoriteRestaurantsLocalDataSource(realm: realm!)
        
    let mapper = RestaurantTransformer()
    
    let repository = GetFavoriteRestaurantsRepository(localeDataSource: locale, mapper: mapper)
    
    return Interactor(repository: repository) as! U
    
  }
  
  func provideDetail<U: UseCase>() -> U where U.Request == String, U.Response == DetailRestaurantModel {
    
    let remote = GetRestaurantByIdRemoteDataSource(endpoint: EndPoints.Gets.detailRestaurant.url)
    
    let mapper = DetailRestaurantTransformer()
    
    let repository = GetDetailRestaurantRepository(remoteDataSource: remote, mapper: mapper)
    
    return Interactor(repository: repository) as! U
    
  }
  
  func provideUpdateFavorite<U: UseCase>() -> U where U.Request == String, U.Response == RestaurantDomainModel {
    
    let locale = GetFavoriteRestaurantsLocalDataSource(realm: realm!)
    
    let mapper = DetailRestaurantTransformer()
    
    let repository = UpdateFavoriteRestaurantRepository(localeDataSource: locale, mapper: mapper)
    
    return Interactor(repository: repository) as! U
  }
  
}
