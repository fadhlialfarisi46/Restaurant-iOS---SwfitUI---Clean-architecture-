//
//  Mapper.swift
//  
//
//  Created by fadhlialfarisi on 13/10/23.
//

import Foundation

public protocol Mapper {
  associatedtype Response
  associatedtype DetailResponse
  associatedtype Entity
  associatedtype Entities
  associatedtype Domains
  associatedtype Domain
  associatedtype DetailDomain
  
  func transformResponseToEntity(response: Response) -> Entities
  func transformEntityToDomain(entity: Entities) -> Domains
  func transformRestaurantEntityToDomain(entity: Entity) -> Domain
  func transformDetailRestaurantResponseToDomain(detailResponse: DetailResponse) -> DetailDomain
}
