//
//  GetRestaurantByIdRemoteDataSource.swift
//  
//
//  Created by fadhlialfarisi on 14/10/23.
//

import Core
import Combine
import Alamofire
import Foundation

public struct GetRestaurantByIdRemoteDataSource : DataSource {
  
  public typealias Request = String
  
  public typealias Response = DetailRestaurantResponse
  
  private let _endpoint: String
  
  public init(endpoint: String) {
    _endpoint = endpoint
  }
  
public func execute(request: String?) -> AnyPublisher<DetailRestaurantResponse, Error> {
    return Future<DetailRestaurantResponse, Error> { completion in
      
      guard let request = request else {
        return completion(.failure(URLError.invalidRequest))
      }
      
      if let url = URL(string: _endpoint + request) {
        AF.request(url)
          .validate()
          .responseDecodable(of: DetailRestaurantByIdResponse.self) { response in
            switch response.result {
              case .success(let value):
                completion(.success(value.restaurant))
              case .failure:
                completion(.failure(URLError.invalidResponse))
            }
          }
      }
    }.eraseToAnyPublisher()
  }
}
