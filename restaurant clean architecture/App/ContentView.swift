//
//  ContentView.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import SwiftUI
import Core
import Restaurant
import Profile

struct ContentView: View {
  @EnvironmentObject var homePresenter: GetListPresenter<
    Any,
    RestaurantDomainModel, Interactor<Any, [RestaurantDomainModel], GetRestaurantsRepository<GetRestaurantsLocaleDataSource, GetRestaurantsRemoteDataSource, RestaurantTransformer>>>
  
  @EnvironmentObject var favoritePresenter:
  GetListPresenter<
    String,
    RestaurantDomainModel, Interactor<String, [RestaurantDomainModel], GetFavoriteRestaurantsRepository<GetFavoriteRestaurantsLocalDataSource, RestaurantTransformer>>>
  
  var body: some View {
    NavigationStack {
      TabView {
        NavigationView{
          HomeView(presenter: homePresenter)
        }.tabItem {
          Label("Home", systemImage: "house")
        }
        
        NavigationView {
          FavoriteView(presenter: favoritePresenter)
        }.tabItem {
          Label("Favorite", systemImage: "star.fill")
        }
        
        NavigationView {
          ProfileView()
        }.tabItem {
          Label("My Profile", systemImage: "person")
        }
      }
    }
  }
}
