//
//  HomePresenter.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 03/10/23.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  private var cancellables: Set<AnyCancellable> = []
  private let router = HomeRouter()
  private let homeUseCase: HomeUseCase
  
  @Published var restaurants: [RestaurantModel] = []
  @Published var errorMessage: String = ""
  @Published var isLoading: Bool = false
  @Published var isError: Bool = false
  
  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }
  
  func getRestaurants() {
    isLoading = true
    homeUseCase.getRestaurants()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
          case .failure(let error):
            self.errorMessage = error.localizedDescription
            self.isError = true
            self.isLoading = false
          case .finished:
            self.isLoading = false
        }
      }, receiveValue: { restaurants in
        self.restaurants = restaurants
      })
      .store(in: &cancellables)
  }
  
  func linkBuilder<Content: View>(
    for restaurant: RestaurantModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: router.makeDetailView(for: restaurant)) { content() }
  }
  
}
