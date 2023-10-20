//
//  GetDetailRestaurantRepository.swift
//  
//
//  Created by fadhlialfarisi on 14/10/23.
//

import Core
import Combine

public struct GetDetailRestaurantRepository<
  RemoteDataSource: DataSource,
  Transformer: Mapper
>: Repository where
RemoteDataSource.Request == String,
RemoteDataSource.Response == DetailRestaurantResponse,
Transformer.DetailResponse == DetailRestaurantResponse,
Transformer.DetailDomain == DetailRestaurantModel
{
  
  public typealias Request = String
  public typealias Response = DetailRestaurantModel
  
  private let _remoteDataSource: RemoteDataSource
  private let _mapper: Transformer
  
  public init(
    remoteDataSource: RemoteDataSource,
    mapper: Transformer) {
      
      _remoteDataSource = remoteDataSource
      _mapper = mapper
    }
 
  public func execute(request: String?) -> AnyPublisher<DetailRestaurantModel, Error> {
    return self._remoteDataSource.execute(request: request)
      .map { self._mapper.transformDetailRestaurantResponseToDomain(detailResponse: $0)
      }.eraseToAnyPublisher()
  }
}
