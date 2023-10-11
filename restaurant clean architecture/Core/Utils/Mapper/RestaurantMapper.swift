//
//  RestaurantMapper.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 02/10/23.
//

import Foundation


final class RestaurantMapper {
  
  static func mapRestaurantResponsesToEntities(input restaurantsResponse: [RestaurantResponse]) ->
  [RestaurantEntity] { return restaurantsResponse.map { result in
    let newRestaurant = RestaurantEntity()
    newRestaurant.id = result.id
    newRestaurant.name = result.name
    newRestaurant.pictureId = result.pictureId
    newRestaurant.rating = result.rating
    newRestaurant.city = result.city
    return newRestaurant
  }
  }
  
  static func mapRestaurantEntitiesToDomains(input restaurantEntities: [RestaurantEntity]) ->
  [RestaurantModel] { return restaurantEntities.map { result in
    return RestaurantModel(
      id: result.id,
      name: result.name,
      pictureId: result.pictureId,
      rating: result.rating,
      city: result.city,
      isFavorite: result.isFavorite
    )
  }
  }
  
  static func mapRestaurantEntityToDomain(input restaurantEntity: RestaurantEntity) -> RestaurantModel {
    return RestaurantModel(
      id: restaurantEntity.id,
      name: restaurantEntity.name,
      pictureId: restaurantEntity.pictureId,
      rating: restaurantEntity.rating,
      city: restaurantEntity.city,
      isFavorite: restaurantEntity.isFavorite
    )
  }
  
  static func mapDetailRestaurantResponseToDomains(input result: DetailRestaurantResponse) ->
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
