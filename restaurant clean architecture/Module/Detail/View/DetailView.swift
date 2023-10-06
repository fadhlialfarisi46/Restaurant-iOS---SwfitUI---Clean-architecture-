//
//  DetailView.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 04/10/23.
//

import SwiftUI

struct DetailView: View {
  
  @ObservedObject var presenter: DetailPresenter
  var baseImgUrl = "https://restaurant-api.dicoding.dev/images/medium/"
  
  var body: some View {
    ZStack {
      if presenter.isLoading {
        loadingIndicator
      } else {
        ScrollView(.vertical) {
          content
        }
      }
    }.onAppear {
      self.presenter.getDetailRestaurant()
    }
  }
}

extension DetailView {
  
  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      ProgressView()
    }
  }
  
  
  var content: some View {
    VStack(spacing: 16) {
      image
      cityAndRating
      Divider()
      nameAndDesc
      Divider()
      categories
      foods
      drinks
      Spacer(minLength: 16)
    }
  }
  
  
  var image: some View {
    ZStack {
      AsyncImage(url: URL(string:  baseImgUrl + (presenter.detailRestaurant?.pictureId ?? ""))) {image in
        image.resizable()
          .aspectRatio(contentMode: .fit)
      } placeholder: {
        ProgressView()
      }
    }
  }
  
  var cityAndRating: some View {
    HStack(spacing: 20) {
      VStack {
        Image(systemName: "location").foregroundColor(Color.blue)
        Spacer()
        Text(presenter.detailRestaurant?.city ?? "").foregroundColor(Color.black)
      }
      Divider()
      VStack {
        Image(systemName: "star.fill").foregroundColor(Color.yellow)
        Spacer()
        Text(String(presenter.detailRestaurant?.rating ?? 0)).foregroundColor(Color.black)
      }
    }
  }
  
  var nameAndDesc: some View {
    VStack(spacing: 0) {
      Text(presenter.detailRestaurant?.name ?? "")
        .font(.title)
        .fontWeight(.bold)
      Text(presenter.detailRestaurant?.description ?? "")
        .font(.caption)
        .lineLimit(4)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }.frame(width: UIScreen.main.bounds.width - 16)
  }
  
  var categories: some View {
    CustomChipSection(
      titleSection: "Categories",
      items: presenter.detailRestaurant?.categories.map { $0.name } ?? [],
      chipColor: Color.blue)
  }
  
  var foods: some View {
    CustomChipSection(
      titleSection: "Foods",
      items: presenter.detailRestaurant?.menus.foods.map { $0.name } ?? [],
      chipColor: Color.green)
  }
  
  var drinks: some View {
    CustomChipSection(
      titleSection: "Drinks",
      items: presenter.detailRestaurant?.menus.drinks.map { $0.name } ?? [],
      chipColor: Color.mint)
  }
}

//struct DetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    let restaurant = RestaurantModel(id: "123", name: "ini restaurant", pictureId: "14", rating: 0.0, city: "Jakarta")
//
//    DetailView(presenter: DetailPresenter(detailUseCase: Injection.init().provideDetail(detailRestaurant: restaurant )))
//  }
//}
