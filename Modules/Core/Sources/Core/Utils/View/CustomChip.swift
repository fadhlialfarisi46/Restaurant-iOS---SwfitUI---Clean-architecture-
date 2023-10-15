//
//  CustomChip.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 06/10/23.
//

import SwiftUI

public struct CustomChip: View {
  public let text: String
  public let fgColor: Color
  
  public init(text: String, fgColor: Color) {
    self.text = text
    self.fgColor = fgColor
  }

  public var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .fill(fgColor)
      
      Text(text)
        .font(.system(size: 14))
        .foregroundColor(Color.white)
        .padding()
    }
  }
}

struct CustomChip_Previews: PreviewProvider {
    static var previews: some View {
      CustomChip(text: "Test", fgColor: Color.blue)
    }
}
