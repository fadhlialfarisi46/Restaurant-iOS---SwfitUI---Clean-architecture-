//
//  GetRestaurantsRemoteDataSource.swift
//  
//
//  Created by fadhlialfarisi on 13/10/23.
//

import Core
import Combine
import Alamofire
import Foundation

public struct GetRestaurantsRemoteDataSource : DataSource {
  public typealias Request = Any
  
  public typealias Response = [RestaurantResponse]
  
  private let _endpoint: String
  
  public init(endpoint: String) {
    _endpoint = endpoint
  }
  
  public func execute(request: Any?) -> AnyPublisher<[RestaurantResponse], Error> {
    return Future<[RestaurantResponse], Error> { completion in
      if let url = URL(string: _endpoint) {
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
}
