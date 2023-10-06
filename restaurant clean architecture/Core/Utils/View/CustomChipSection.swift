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
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(items, id: \.self) { item in
            CustomChip(text: item, fgColor: chipColor)
          }
        }
      }
    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))    }
}

//struct CustomChipSection_Previews: PreviewProvider {
//  static var previews: some View {
//    CustomChipSection()
//  }
//}
