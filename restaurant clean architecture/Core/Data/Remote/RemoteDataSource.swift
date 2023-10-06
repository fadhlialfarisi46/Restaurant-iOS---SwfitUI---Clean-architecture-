//
//  RemoteDataSource.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import Foundation
import Alamofire
import Combine

protocol RemoteDataSourceProtocol: AnyObject {
  
  func getRestaurants() -> AnyPublisher<[RestaurantResponse], Error>
  
}

final class RemoteDataSource: NSObject {
  
  private override init() {  }
  
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func getRestaurants() -> AnyPublisher<[RestaurantResponse], Error> {
    return Future<[RestaurantResponse], Error> { completion in
      if let url = URL(string: EndPoints.Gets.restaurants.url) {
        AF.request(url)
          .validate()
          .responseDecodable(of: RestaurantsResponse.self) { response in
            switch response.result {
              case .success(let value):
                completion(.success(value.restaurants))
              case .failure:
                completion(.failure(URLError.invalidResponse))
            }
          }
      }
    }.eraseToAnyPublisher()
  }
  
  func getDetailRestaurant(by id: String) -> AnyPublisher<DetailRestaurantResponse, Error> {
    return Future<DetailRestaurantResponse, Error> { completion in
      if let url = URL(string: EndPoints.Gets.detailRestaurant.url + id) {
        AF.request(url)
          .validate()
          .responseDecodable(of: DetailRestaurantByIdResponse.self) { response in
            switch response.result {
              case .success(let value): completion(.success(value.restaurant))
              case .failure: completion(.failure(URLError.invalidResponse))
            }
          }
      }
    }.eraseToAnyPublisher()
  }
  
}
