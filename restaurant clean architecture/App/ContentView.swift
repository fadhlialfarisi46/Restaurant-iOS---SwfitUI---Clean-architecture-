//
//  ContentView.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import SwiftUI
import Core
import Restaurant
import Favorite
import Detail

typealias HomePresenter = GetListPresenter<
  Any,
  RestaurantDomainModel, Interactor<Any, [RestaurantDomainModel], GetRestaurantsRepository<GetRestaurantsLocaleDataSource, GetRestaurantsRemoteDataSource, RestaurantTransformer>>>

typealias FavoritePresenter = GetListPresenter<
  String,
  RestaurantDomainModel, Interactor<String, [RestaurantDomainModel], GetFavoriteRestaurantsRepository<GetFavoriteRestaurantsLocalDataSource, RestaurantTransformer>>>

public let detailUseCase: Interactor<
  String,
  DetailRestaurantModel,
  GetDetailRestaurantRepository<
    GetRestaurantByIdRemoteDataSource,
    DetailRestaurantTransformer
  >> =  type(of: Injection()).init().provideDetail()

public let updateFavoriteUseCase: Interactor<
  String,
  RestaurantDomainModel,
  UpdateFavoriteRestaurantRepository<
    GetFavoriteRestaurantsLocalDataSource,
    DetailRestaurantTransformer
  >> =  type(of: Injection()).init().provideUpdateFavorite()

struct ContentView: View {
  
  @EnvironmentObject var _homePresenter: HomePresenter
  
  @EnvironmentObject var _favoritePresenter: FavoritePresenter
  
  var body: some View {
    NavigationStack {
      TabView {
        NavigationView{
          HomeView(presenter: _homePresenter)
        }.tabItem {
          Label("Home", systemImage: "house")
        }
        
        NavigationView {
          FavoriteView(presenter: _favoritePresenter)
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
