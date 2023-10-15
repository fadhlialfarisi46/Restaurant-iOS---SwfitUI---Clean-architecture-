//
//  RestaurantModuleEntity.swift
//  
//
//  Created by fadhlialfarisi on 13/10/23.
//

import Foundation
import RealmSwift

public class RestaurantModuleEntity: Object {
  
  @objc dynamic var id: String = ""
  @objc dynamic var name: String = ""
  @objc dynamic var pictureId: String = ""
  @objc dynamic var city: String = ""
  @objc dynamic var rating: Double = 0.0
  @objc dynamic var isFavorite: Bool = false
  
  public override class func primaryKey() -> String? {
    return "id"
  }
}
