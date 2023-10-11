//
//  ContentView.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var homePresenter: HomePresenter
  @EnvironmentObject var favoritePresenter: FavoritePresenter
  
  var body: some View {
    TabView {
      NavigationStack {
        TabView {
          HomeView(presenter: homePresenter)
            .tabItem {
              Label("Home", systemImage: "house")
            }
          
          FavoriteView(presenter: favoritePresenter)
            .tabItem {
              Label("Favorite", systemImage: "star.fill")
            }
          
          ProfileView()
            .tabItem {
              Label("My Profile", systemImage: "person")
            }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
