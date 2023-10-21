//
//  DetailRestaurantTransformer.swift
//  
//
//  Created by fadhlialfarisi on 19/10/23.
//

import Core
import Restaurant

public struct DetailRestaurantTransformer: Mapper {
  
  public typealias DetailResponse = DetailRestaurantResponse
  
  public typealias Response = [RestaurantResponse]
  
  public typealias Entity = RestaurantModuleEntity
  public typealias Entities = [RestaurantModuleEntity]
  
  public typealias Domains = [RestaurantDomainModel]
  public typealias Domain = RestaurantDomainModel
  public typealias DetailDomain = DetailRestaurantModel
  
  public init() {}
  
  public func transformResponseToEntity(response restaurantsResponse: [RestaurantResponse]) ->
  [RestaurantModuleEntity] {[]}
  
  public func transformEntityToDomain(entity restaurantEntities: [RestaurantModuleEntity]) ->
  [RestaurantDomainModel] {[]}
  
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
