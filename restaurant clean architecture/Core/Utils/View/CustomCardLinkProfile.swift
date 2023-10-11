//
//  CustomCardLinkProfile.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 07/10/23.
//

import SwiftUI

struct CustomCardLinkProfile: View {
  let icon: String
  let text: String
  let fgColor: Color
  
    var body: some View {
     
      HStack(spacing: 8) {
        Image(icon)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 40, height: 40)
        Text(text)
          .foregroundColor(.white)
          .font(.title3)
      }.padding()
        .frame(width: UIScreen.main.bounds.width - 16, alignment: .leading)
        .background(fgColor).clipShape(RoundedRectangle(cornerRadius:20))
    }
}

struct CustomCardLinkProfile_Previews: PreviewProvider {
    static var previews: some View {
      CustomCardLinkProfile(icon: "linkedin", text: "fadhli", fgColor: .blue)
    }
}
