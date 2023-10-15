//
//  GetRestaurantsRepository.swift
//  
//
//  Created by fadhlialfarisi on 13/10/23.
//

import Core
import Combine

public struct GetRestaurantsRepository<
  RestaurantLocaleDataSource: LocaleDataSource,
  RemoteDataSource: DataSource,
  Transformer: Mapper
>: Repository where
RestaurantLocaleDataSource.Response == RestaurantModuleEntity,
RemoteDataSource.Response == [RestaurantResponse],
Transformer.Response == [RestaurantResponse],
Transformer.Entities == [RestaurantModuleEntity],
Transformer.Domains == [RestaurantDomainModel]
{
  
  public typealias Request = Any
  public typealias Response = [RestaurantDomainModel]
  
  private let _localeDataSource: RestaurantLocaleDataSource
  private let _remoteDataSource: RemoteDataSource
  private let _mapper: Transformer
  
  public init(
    localeDataSource: RestaurantLocaleDataSource,
    remoteDataSource: RemoteDataSource,
    mapper: Transformer) {
      
      _localeDataSource = localeDataSource
      _remoteDataSource = remoteDataSource
      _mapper = mapper
    }
  
  public func execute(request: Any?) -> AnyPublisher<[RestaurantDomainModel], Error> {
    return _localeDataSource.list(request: nil)
      .flatMap { result -> AnyPublisher<[RestaurantDomainModel], Error> in
        if result.isEmpty {
          return _remoteDataSource.execute(request: nil)
            .map { _mapper.transformResponseToEntity(response: $0) }
            .catch { _ in _localeDataSource.list(request: nil) }
            .flatMap { _localeDataSource.add(entities: $0) }
            .filter { $0 }
            .flatMap { _ in _localeDataSource.list(request: nil)
                .map { _mapper.transformEntityToDomain(entity: $0) }
            }
            .eraseToAnyPublisher()
        } else {
          return _localeDataSource.list(request: nil)
            .map { _mapper.transformEntityToDomain(entity: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }
}
