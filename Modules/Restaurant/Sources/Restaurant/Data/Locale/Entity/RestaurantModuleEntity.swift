//
//  RestaurantModuleEntity.swift
//  
//
//  Created by fadhlialfarisi on 13/10/23.
//

import Foundation
import RealmSwift

public class RestaurantModuleEntity: Object {
  
  @objc dynamic public var id: String = ""
  @objc dynamic public var name: String = ""
  @objc dynamic public var pictureId: String = ""
  @objc dynamic public var city: String = ""
  @objc dynamic public var rating: Double = 0.0
  @objc dynamic public var isFavorite: Bool = false
  
  public override class func primaryKey() -> String? {
    return "id"
  }

}
