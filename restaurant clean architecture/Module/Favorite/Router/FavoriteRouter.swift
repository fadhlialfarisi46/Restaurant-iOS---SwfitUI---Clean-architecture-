//
//  FavoriteRouter.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 06/10/23.
//

import SwiftUI
import Restaurant
import Core
import Favorite

class FavoriteRouter {
  
  func makeDetailView(for restaurant: RestaurantDomainModel) -> some View {
    
    let detailUseCase: Interactor<
      String,
      DetailRestaurantModel,
      GetDetailRestaurantRepository<
        GetRestaurantByIdRemoteDataSource,
        RestaurantTransformer
      >> = Injection.init().provideDetail()
    
    let favoriteUseCase: Interactor<
      String,
      RestaurantDomainModel,
      UpdateFavoriteRestaurantRepository<
        GetFavoriteRestaurantsLocalDataSource,
        RestaurantTransformer
      >> = Injection.init().provideUpdateFavorite()
    
    let presenter = DetailPresenter(detailUseCase: detailUseCase, favoriteUseCase: favoriteUseCase)
    return DetailView(presenter: presenter, restaurant: restaurant)
  }
  
}
