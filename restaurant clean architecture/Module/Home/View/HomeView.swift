//
//  HomeView.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 03/10/23.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  
  var body: some View {
    ZStack {
      if presenter.isLoading {
        loadingIndicator
      } else if presenter.isError {
        errorIndicator
      } else if presenter.restaurants.isEmpty {
        emptyRestaurants
      } else {
        content
      }
    }.onAppear {
      if self.presenter.restaurants.count == 0 {
        self.presenter.getRestaurants()
      }
    }.navigationBarTitle(
      Text("Restaurants App"),
      displayMode: .automatic
    )
  }
}

extension HomeView {
  
  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      ProgressView()
    }
  }
  
  var emptyRestaurants: some View {
    VStack {
      Image(systemName: "xmark.app")
        .font(.system(size: 100))
        .foregroundColor(.red)
      Text("Empty")
    }
  }
  
  var errorIndicator: some View {
    VStack {
      Image(systemName: "exclamationmark.bubble.circle.fill")
        .font(.system(size: 100))
        .foregroundColor(.red)
      Text(presenter.errorMessage)
    }
  }
  
  var content: some View {
    ScrollView(.vertical, showsIndicators: false) {
      ForEach(
        self.presenter.restaurants,
        id: \.id
      ) { restaurant in
        self.presenter.linkBuilder(for: restaurant) {
          VStack {
            RestaurantRow(restaurant: restaurant)
            Spacer()
            Divider()
          }
        }
      }
    }
  }
}


struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(presenter: HomePresenter(homeUseCase: Injection.init().provideHome()))
  }
}
