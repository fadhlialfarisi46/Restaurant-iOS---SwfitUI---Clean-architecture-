//
//  RestaurantTransformer.swift
//  
//
//  Created by fadhlialfarisi on 13/10/23.
//

import Core

public struct RestaurantTransformer: Mapper {
  
  public typealias DetailResponse = RestaurantResponse
    
  public typealias Response = [RestaurantResponse]
  
  public typealias Entity = RestaurantModuleEntity
  public typealias Entities = [RestaurantModuleEntity]
  
  public typealias Domains = [RestaurantDomainModel]
  public typealias Domain = RestaurantDomainModel
  public typealias DetailDomain = RestaurantDomainModel
  
  public init() {}

  public func transformResponseToEntity(response restaurantsResponse: [RestaurantResponse]) ->
  [RestaurantModuleEntity] { return restaurantsResponse.map { result in
    let newRestaurant = RestaurantModuleEntity()
    newRestaurant.id = result.id
    newRestaurant.name = result.name
    newRestaurant.pictureId = result.pictureId
    newRestaurant.rating = result.rating
    newRestaurant.city = result.city
    return newRestaurant
  }
  }
  
  public func transformEntityToDomain(entity restaurantEntities: [RestaurantModuleEntity]) ->
  [RestaurantDomainModel] { return restaurantEntities.map { result in
    return RestaurantDomainModel(
      id: result.id,
      name: result.name,
      pictureId: result.pictureId,
      rating: result.rating,
      city: result.city,
      isFavorite: result.isFavorite
    )
  }
  }
  
  public func transformRestaurantEntityToDomain(entity restaurantEntity: RestaurantModuleEntity) -> RestaurantDomainModel {
    return RestaurantDomainModel(
      id: restaurantEntity.id,
      name: restaurantEntity.name,
      pictureId: restaurantEntity.pictureId,
      rating: restaurantEntity.rating,
      city: restaurantEntity.city,
      isFavorite: restaurantEntity.isFavorite
    )
  }
  
  public func transformDetailRestaurantResponseToDomain(detailResponse: RestaurantResponse) -> RestaurantDomainModel {
    RestaurantDomainModel(id: "", name: "", pictureId: "", rating: 0, city: "", isFavorite: false)
  }
}
