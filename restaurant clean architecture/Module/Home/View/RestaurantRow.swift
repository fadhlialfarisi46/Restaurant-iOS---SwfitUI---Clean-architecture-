//
//  RestaurantRow.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 03/10/23.
//

import SwiftUI

struct RestaurantRow: View {
  
  var restaurant: RestaurantModel
  
  var baseImgUrl = "https://restaurant-api.dicoding.dev/images/medium/"
  
  var body: some View {
    VStack {
      imageRestaurant
      Spacer(minLength: 8)
      content
    }
    .frame(width: UIScreen.main.bounds.width - 16)
    .cornerRadius(16)
    
  }
}

extension RestaurantRow {
  
  var imageRestaurant: some View {
    AsyncImage(url: URL(string: baseImgUrl + restaurant.pictureId)) { image in
      image.resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: UIScreen.main.bounds.width, height: 200)
        .clipped()
    } placeholder: {
      ProgressView()
    }
    .frame(width: UIScreen.main.bounds.width, height: 200)
  }
  
  var content: some View {
    VStack(alignment: .leading) {
      Text(restaurant.name)
        .font(.title)
        .bold()
        .foregroundColor(Color.black)
      Spacer()

      HStack {
        Label {
          Text(String(restaurant.city)).foregroundColor(Color.black)
        } icon: {
          Image(systemName: "location").foregroundColor(Color.blue)
        }
        Spacer()
        Label {
          Text(String(restaurant.rating)).foregroundColor(Color.black)
        } icon: {
          Image(systemName: "star.fill").foregroundColor(Color.yellow)
        }
      }
    }.padding(
      EdgeInsets(
        top: 0,
        leading: 16,
        bottom: 8,
        trailing: 16
      )
    )
  }
}

struct RestaurantRow_Previews: PreviewProvider {
  static var previews: some View {
    RestaurantRow(restaurant: RestaurantModel(id: "1", name: "Halal bro", pictureId: "22", rating: 5.0, city: "Jakarta"))
  }
}
