//
//  ProfileView.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 07/10/23.
//

import SwiftUI
import Core

struct ProfileView: View {
  
  var body: some View {
    VStack() {
      Image("profile")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 100, height: 100)
        .clipShape(Circle())
      Text("Muhammad Fadhli AlFarisi")
        .font(.title)
      Text("Mobile Developer")
        .font(.title2)
      CustomCardLinkProfile(
        icon: "gmail",
        text: "fadhlialfarisi46@gmail.com",
        fgColor: .mint)
      CustomCardLinkProfile(
        icon: "github",
        text: "github.com/fadhlialfarisi46",
        fgColor: .black)
      CustomCardLinkProfile(
        icon: "linkedin",
        text: "linkedin.com/in/fadhli-alfarisi",
        fgColor: .blue)
    }
  }
}

