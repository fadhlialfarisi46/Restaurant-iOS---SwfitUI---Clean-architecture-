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
import Detail

class FavoriteRouter {
  
  func makeDetailView(for restaurant: RestaurantDomainModel) -> some View {
    
    let presenter = DetailPresenterMain(detailUseCase: detailUseCase, favoriteUseCase: updateFavoriteUseCase)
    return DetailView(presenter: presenter, restaurant: restaurant)
  }
  
}
