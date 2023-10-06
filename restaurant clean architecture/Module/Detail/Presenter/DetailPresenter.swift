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
  @Published var errorMessage: String = ""
  @Published var isLoading: Bool = false
  @Published var isError: Bool = false
  
  init(detailUseCase: DetailUseCase) {
    self.detailUseCase = detailUseCase
//    detailRestaurant = detailUseCase.getDetailRestaurant()
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
  
}
