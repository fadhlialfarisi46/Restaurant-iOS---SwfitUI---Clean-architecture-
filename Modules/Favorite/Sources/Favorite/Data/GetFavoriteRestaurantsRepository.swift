//
//  GetFavoriteRestaurantsRepository.swift
//  
//
//  Created by fadhlialfarisi on 14/10/23.
//

import Core
import Combine
import Restaurant

public struct GetFavoriteRestaurantsRepository<
  GetFavoriteRestaurantsLocalDataSource: LocaleDataSource,
  Transformer: Mapper
>: Repository where
GetFavoriteRestaurantsLocalDataSource.Request == String,
GetFavoriteRestaurantsLocalDataSource.Response == RestaurantModuleEntity,
Transformer.Entities == [RestaurantModuleEntity],
Transformer.Domains == [RestaurantDomainModel] {
  
  public typealias Request = String
  
  public typealias Response = [RestaurantDomainModel]
  
  private let localeDataSource: GetFavoriteRestaurantsLocalDataSource
  private let mapper: Transformer
  
  public init(
    localeDataSource: GetFavoriteRestaurantsLocalDataSource,
    mapper: Transformer
  ) {
    self.localeDataSource = localeDataSource
    self.mapper = mapper
  }
  
  public func execute(request: String?) -> AnyPublisher<[RestaurantDomainModel], Error> {

    return self.localeDataSource.list(request: request)
      .map { self.mapper.transformEntityToDomain(entity: $0)}
      .eraseToAnyPublisher()
  }
 
}
