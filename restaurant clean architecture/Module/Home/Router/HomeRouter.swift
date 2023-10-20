//
//  HomeRouter.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 03/10/23.
//

import SwiftUI
import Restaurant
import Core
import Favorite
import Detail

class HomeRouter {
  
  func makeDetailView(for restaurant: RestaurantDomainModel) -> some View {
    
    let detailUseCase: Interactor<
      String,
      DetailRestaurantModel,
      GetDetailRestaurantRepository<
        GetRestaurantByIdRemoteDataSource,
        DetailRestaurantTransformer
      >> = Injection.init().provideDetail()
    
    let favoriteUseCase: Interactor<
      String,
      RestaurantDomainModel,
      UpdateFavoriteRestaurantRepository<
        GetFavoriteRestaurantsLocalDataSource,
        DetailRestaurantTransformer
      >> = Injection.init().provideUpdateFavorite()
    
    let presenter = DetailPresenter(detailUseCase: detailUseCase, favoriteUseCase: favoriteUseCase)
    return DetailView(presenter: presenter, restaurant: restaurant)
  }

}
