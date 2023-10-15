//
//  HomeView.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 03/10/23.
//

import SwiftUI
import Core
import Restaurant

struct HomeView: View {
  
  @ObservedObject var presenter: GetListPresenter<
    Any,
    RestaurantDomainModel, Interactor<Any, [RestaurantDomainModel], GetRestaurantsRepository<GetRestaurantsLocaleDataSource, GetRestaurantsRemoteDataSource, RestaurantTransformer>>>
  
  var body: some View {
    ZStack {
      if presenter.isLoading {
        loadingIndicator
      } else if presenter.isError {
        errorIndicator
      } else if presenter.list.isEmpty {
        emptyRestaurants
      } else {
        content
      }
    }.onAppear {
      if self.presenter.list.count == 0 {
        self.presenter.getList(request: nil )
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
        self.presenter.list,
        id: \.id
      ) { restaurant in
        linkBuilder(for: restaurant) {
          VStack {
            RestaurantRow(restaurant: restaurant)
            Spacer()
            Divider()
          }
        }
      }
    }
  }
  
  func linkBuilder<Content: View>(
    for restaurant: RestaurantDomainModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: HomeRouter().makeDetailView(for: restaurant)) { content() }
  }
  
}
