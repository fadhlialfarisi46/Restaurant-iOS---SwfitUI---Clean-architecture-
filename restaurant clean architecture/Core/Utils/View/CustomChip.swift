//
//  CustomChip.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 06/10/23.
//

import SwiftUI

struct CustomChip: View {
  let text: String
  let fgColor: Color
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .fill(fgColor)
        .frame(width: .infinity, height: 40)
      
      Text(text)
        .foregroundColor(Color.white)
        .padding()
    }
    .padding(8)
  }
}

struct CustomChip_Previews: PreviewProvider {
    static var previews: some View {
      CustomChip(text: "Test", fgColor: Color.blue)
    }
}
