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
    
    let presenter = DetailPresenterMain(detailUseCase: detailUseCase, favoriteUseCase: updateFavoriteUseCase)
    return DetailView(presenter: presenter, restaurant: restaurant)
  }

}
