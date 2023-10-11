//
//  DetailPresenter.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 04/10/23.
//

import Foundation
import Combine

class DetailPresenter: ObservableObject {
  
  private var cancellables: Set<AnyCancellable> = []
  private let detailUseCase: DetailUseCase
  
  @Published var detailRestaurant: DetailRestaurantModel?
  @Published var restaurant: RestaurantModel?
  @Published var errorMessage: String = ""
  @Published var isLoading: Bool = false
  @Published var isError: Bool = false
  
  init(detailUseCase: DetailUseCase) {
    self.detailUseCase = detailUseCase
    restaurant = detailUseCase.getRestaurant()
  }
  
  func getDetailRestaurant() {
    isLoading = true
    detailUseCase.getDetailRestaurant()
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
      }, receiveValue: { detailRestaurant in
        self.detailRestaurant = detailRestaurant
      })
      .store(in: &cancellables)
  }
  
  func updateFavoriteRestaurant() {
    detailUseCase.updateFavoriteRestaurant()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
          case .failure:
            self.errorMessage = String(describing: completion)
          case .finished:
            self.isLoading = false
        }
      }, receiveValue: { restaurant in
        self.restaurant = restaurant
      })
      .store(in: &cancellables)
  }
  
}
