//
//  FavoriteRouter.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 06/10/23.
//

import SwiftUI

class FavoriteRouter {
  
  func makeDetailView(for restaurant: RestaurantModel) -> some View {
    let detailUseCase = Injection.init().provideDetail(detailRestaurant: restaurant)
    let presenter = DetailPresenter(detailUseCase: detailUseCase)
    return DetailView(presenter: presenter)
  }
  
}
