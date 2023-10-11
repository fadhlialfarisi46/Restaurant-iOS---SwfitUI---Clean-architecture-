//
//  FavoriteView.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 06/10/23.
//

import SwiftUI

struct FavoriteView: View {
  
  @ObservedObject var presenter: FavoritePresenter
  
  var body: some View {
    ZStack {
      if presenter.isLoading {
        loadingIndicator
      } else if presenter.isError {
        errorIndicator
      } else if presenter.restaurants.isEmpty {
        emptyCategories
      } else {
        content
      }
    }.onAppear {
      self.presenter.getFavoriteRestaurants()
    }.navigationBarTitle(
      Text("Favorite Restaurants"),
      displayMode: .automatic
    )
  }
}

extension FavoriteView {
  
  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      ProgressView()
    }
  }
  
  var emptyCategories: some View {
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

//struct FavoriteView_Previews: PreviewProvider {
//  static var previews: some View {
//    FavoriteView()
//  }
//}
