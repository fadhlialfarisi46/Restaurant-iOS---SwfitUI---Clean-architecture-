//
//  DetailView.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 04/10/23.
//

import SwiftUI
import Restaurant
import Core
import Favorite

struct DetailView: View {
  
  @ObservedObject var presenter: DetailPresenter<
    Interactor<
      String,
      DetailRestaurantModel,
      GetDetailRestaurantRepository<
        GetRestaurantByIdRemoteDataSource,
        RestaurantTransformer
      >>,
    Interactor<
      String,
      RestaurantDomainModel,
      UpdateFavoriteRestaurantRepository<
        GetFavoriteRestaurantsLocalDataSource,
        RestaurantTransformer
      >>>
  
  var restaurant: RestaurantDomainModel
  
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
      self.presenter.getDetailRestaurant(request: restaurant.id)
      self.presenter.setInitRestaurant(restaurant: restaurant)
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
      imageWithFavIcon
      Spacer(minLength: 24)
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
  
  
  var imageWithFavIcon: some View {
    AsyncImage(url: URL(string:  baseImgUrl + (presenter.detailRestaurant?.pictureId ?? "14"))) { image in
      ZStack(alignment: .bottomTrailing) {
        image.resizable()
          .scaledToFill()
          .frame(width: UIScreen.main.bounds.width, height: 300)
        
        if presenter.restaurant?.isFavorite == true {
          Circle()
            .fill(Color.white)
            .frame(width: 55, height: 55)
            .overlay(
              Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundColor(.red)
            )
            .offset(x: -16, y: 25)
            .onTapGesture {
              print("gesture tap \(restaurant.id) true")
              self.presenter.updateFavoriteRestaurant(request: restaurant.id)
            }
        } else {
          Circle()
            .fill(Color.white)
            .frame(width: 55, height: 55)
            .overlay(
              Image(systemName: "heart")
                .font(.system(size: 40))
                .foregroundColor(.red)
            )
            .offset(x: -16, y: 25)
            .onTapGesture {
              print("gesture tap \(restaurant.id) false")
              self.presenter.updateFavoriteRestaurant(request: restaurant.id)
            }
        }
        
      }
    } placeholder: {
      ProgressView()
    }.frame(width: UIScreen.main.bounds.width, height: 324)
    
  }
  
  var cityAndRating: some View {
    HStack(spacing: 20) {
      VStack {
        Image(systemName: "mappin.and.ellipse").foregroundColor(Color.blue)
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
