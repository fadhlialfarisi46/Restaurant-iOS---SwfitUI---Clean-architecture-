//
//  restaurant_clean_architectureApp.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import SwiftUI
import RealmSwift
import Core
import Restaurant

let homeUseCase: Interactor<
  Any,
  [RestaurantDomainModel],
  GetRestaurantsRepository<
    GetRestaurantsLocaleDataSource,
    GetRestaurantsRemoteDataSource,
    RestaurantTransformer>
> = type(of: Injection()).init().provideHome()

let favoriteUseCase: Interactor<
  String,
  [RestaurantDomainModel],
  GetFavoriteRestaurantsRepository<
    GetFavoriteRestaurantsLocalDataSource,
    RestaurantTransformer>
> = type(of: Injection()).init().provideFavorite()

@main
struct RestaurantCleanArchitectureApp: SwiftUI.App {
  let homePresenter = GetListPresenter(useCase: homeUseCase)
  let favoritePresenter = GetListPresenter(useCase: favoriteUseCase)
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(homePresenter)
        .environmentObject(favoritePresenter)
    }
  }
}
