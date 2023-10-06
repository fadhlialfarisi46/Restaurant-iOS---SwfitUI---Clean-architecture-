//
//  ContentView.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var homePresenter: HomePresenter
  
  var body: some View {
    TabView {
      NavigationStack {
        HomeView(presenter: homePresenter)
      }.tabItem {
          Label("Home", systemImage: "house")
        }
      
      NavigationStack {
        
      }.tabItem {
        Label("Favorite", systemImage: "star.fill")
      }
      
      NavigationStack {
        
      }.tabItem {
        Label("My Profile", systemImage: "person")
      }
      
      //        NavigationStack {
      //
      //        }.tabItem {
      //          UITabBarItem(title: "Favorite", image: UIImage(named: "star"), tag: 0)
      //        }
      //        NavigationStack {
      //
      //        }.tabItem {
      //          UITabBarItem(title: "My Profile", image: UIImage(named: "house"), tag: 0)
      //        }
      //
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
