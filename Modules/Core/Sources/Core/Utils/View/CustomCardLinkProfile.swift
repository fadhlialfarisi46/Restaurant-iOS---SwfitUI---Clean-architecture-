//
//  CustomCardLinkProfile.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 07/10/23.
//

import SwiftUI

public struct CustomCardLinkProfile: View {
  public let icon: String
  public let text: String
  public let fgColor: Color
  
  public init(icon: String, text: String, fgColor: Color) {
    self.icon = icon
    self.text = text
    self.fgColor = fgColor
  }
  
  public var body: some View {
    
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
