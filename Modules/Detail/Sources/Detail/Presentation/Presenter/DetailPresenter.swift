//
//  DetailPresenter.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 04/10/23.
//

import Foundation
import Combine
import Restaurant
import Core

public class DetailPresenter<
  DetailUseCase: UseCase,
  FavoriteUseCase: UseCase
>: ObservableObject  where
DetailUseCase.Request == String,
DetailUseCase.Response == DetailRestaurantModel,
FavoriteUseCase.Request == String,
FavoriteUseCase.Response == RestaurantDomainModel
{
  
  private var cancellables: Set<AnyCancellable> = []
  private let detailUseCase: DetailUseCase
  private let favoriteUseCase: FavoriteUseCase
  
  @Published public var restaurant: RestaurantDomainModel?
  @Published public var detailRestaurant: DetailRestaurantModel?
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false
  
  public init(detailUseCase: DetailUseCase, favoriteUseCase: FavoriteUseCase) {
    self.detailUseCase = detailUseCase
    self.favoriteUseCase = favoriteUseCase
  }
  
  public func getDetailRestaurant(request: DetailUseCase.Request) {
    isLoading = true
    detailUseCase.execute(request: request)
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
  
  public func updateFavoriteRestaurant(request: FavoriteUseCase.Request) {
    print("presenter called")
    favoriteUseCase.execute(request: request)
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
  
  public func setInitRestaurant(restaurant: RestaurantDomainModel) {
    self.restaurant = restaurant
  }
  
}
