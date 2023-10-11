//
//  CustomChip.swift
//  restaurant clean architecture
//
//  Created by fadhlialfarisi on 06/10/23.
//

import SwiftUI

struct CustomChipSection: View {
  let titleSection: String
  let items: [String]
  let chipColor: Color
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text(titleSection)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 0))
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          Spacer(minLength: 16)
          ForEach(items, id: \.self) { item in
            CustomChip(text: item, fgColor: chipColor)
          }
          Spacer(minLength: 8)
        }
      }
    }
  }
}

//struct CustomChipSection_Previews: PreviewProvider {
//  static var previews: some View {
//    CustomChipSection()
//  }
//}
