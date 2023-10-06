//
//  Injection.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
  
  private func provideRepository() -> RestaurantRepositoryProtocol {
    let realm = try? Realm()
    
    let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    
    return RestaurantRepository.sharedInstance(locale, remote)
  }
  
  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    return HomeInteractor(repository: repository)
  }
  
  func provideDetail(detailRestaurant: RestaurantModel) -> DetailUseCase {
    let repository = provideRepository()
    return DetailInteractor(repository: repository, restaurant: detailRestaurant)
  }
//  
//  func provideMeal(meal: MealModel) -> MealUseCase {
//    let repository = provideRepository()
//    return MealInteractor(repository: repository, meal: meal)
//  }
//  
//  func provideFavorite() -> FavoriteUseCase {
//    let repository = provideRepository()
//    return FavoriteInteractor(repository: repository)
//  }
//  
//  func provideSearch() -> SearchUseCase {
//    let repository = provideRepository()
//    return SearchInteractor(repository: repository)
//  }
  
}
