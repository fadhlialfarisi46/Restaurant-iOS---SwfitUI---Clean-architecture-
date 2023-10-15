//
//  RestaurantTransformer.swift
//  
//
//  Created by fadhlialfarisi on 13/10/23.
//

import Core

public struct RestaurantTransformer: Mapper {
  
  public typealias DetailResponse = DetailRestaurantResponse
    
  public typealias Response = [RestaurantResponse]
  
  public typealias Entity = RestaurantModuleEntity
  public typealias Entities = [RestaurantModuleEntity]
  
  public typealias Domains = [RestaurantDomainModel]
  public typealias Domain = RestaurantDomainModel
  public typealias DetailDomain = DetailRestaurantModel
  
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
  
  public func transformDetailRestaurantResponseToDomain(detailResponse result: DetailRestaurantResponse) ->
  DetailRestaurantModel {
    
    let categories = result.categories.map { category in
      CategoryModel(name: category.name)
    }
    
    let foods = result.menus.foods.map { food in
      CategoryModel(name: food.name)
    }
    let drinks = result.menus.drinks.map { drink in
      CategoryModel(name: drink.name)
    }
    
    let menus = MenusModel(foods: foods, drinks: drinks)
    
    return DetailRestaurantModel(
      id: result.id,
      name: result.name,
      description: result.description,
      city: result.city,
      address: result.address,
      pictureId: result.pictureId,
      categories: categories,
      menus: menus,
      rating: result.rating
    )
  }
  
}
