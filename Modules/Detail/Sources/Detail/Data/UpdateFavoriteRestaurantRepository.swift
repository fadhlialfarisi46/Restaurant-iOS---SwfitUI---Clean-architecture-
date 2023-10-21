//
//  UpdateFavoriteRestaurantRepository.swift
//  
//
//  Created by fadhlialfarisi on 14/10/23.
//

import Core
import Combine
import Restaurant

public struct UpdateFavoriteRestaurantRepository<
  UpdateFavoriteRestaurantLocalDataSource: LocaleDataSource,
  Transformer: Mapper
>: Repository where
UpdateFavoriteRestaurantLocalDataSource.Request == String,
UpdateFavoriteRestaurantLocalDataSource.Response == RestaurantModuleEntity,
Transformer.Entity == RestaurantModuleEntity,
Transformer.Domain == RestaurantDomainModel
{
  
  public typealias Request = String
  public typealias Response = RestaurantDomainModel
  
  private let localeDataSource: UpdateFavoriteRestaurantLocalDataSource
  private let mapper: Transformer
  
  public init(
    localeDataSource: UpdateFavoriteRestaurantLocalDataSource,
    mapper: Transformer
  ) {
    self.localeDataSource = localeDataSource
    self.mapper = mapper
  }
  
  public func execute(request: String?) -> AnyPublisher<RestaurantDomainModel, Error> {

    return self.localeDataSource.get(id: request ?? "")
      .map { self.mapper.transformRestaurantEntityToDomain(entity: $0) }
      .eraseToAnyPublisher()
  }
}
