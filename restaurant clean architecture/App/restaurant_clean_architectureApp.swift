//
//  restaurant_clean_architectureApp.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import SwiftUI

@main
struct restaurant_clean_architectureApp: App {
  let homePresenter = HomePresenter(homeUseCase: Injection.init().provideHome())
  let favoritePresenter = FavoritePresenter(favoriteUseCase: Injection.init().provideFavorite())
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(homePresenter)
        .environmentObject(favoritePresenter)
    }
  }
}
