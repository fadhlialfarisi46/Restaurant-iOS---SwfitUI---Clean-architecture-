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
//      }
//      else if presenter.isError {
//        errorIndicator
      } else if presenter.restaurants.isEmpty {
        emptyCategories
      } else {
        content
      }
    }.onAppear {
      if self.presenter.restaurants.count == 0 {
        self.presenter.getRestaurants()
      }
    }.navigationBarTitle(
      Text("Restaurants Apps"),
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
  var emptyCategories: some View {
    VStack {
      Text("Empty")
      ProgressView()
    }
  }
  
//  var errorIndicator: some View {
//    CustomEmptyView(
//      image: "assetSearchNotFound",
//      title: presenter.errorMessage
//    ).offset(y: 80)
//  }
//
//  var emptyCategories: some View {
//    CustomEmptyView(
//      image: "assetNoFavorite",
//      title: "The meal category is empty"
//    ).offset(y: 80)
//  }
  
  var content: some View {
    ScrollView(.vertical, showsIndicators: false) {
      ForEach(
        self.presenter.restaurants,
        id: \.id
      ) { restaurant in
        ZStack {
          self.presenter.linkBuilder(for: restaurant) {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
              .fill(.white)
              .shadow(radius: 50)
            
            VStack {
              RestaurantRow(restaurant: restaurant)
              Spacer()
              Divider()
            }
          }
        }.padding()
      }
    }
  }
  
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView(presenter: HomePresenter(homeUseCase: Injection.init().provideHome()))
    }
}
