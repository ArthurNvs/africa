//
//  CoverImageView.swift
//  Africa
//
//  Created by Arthur Neves on 10/11/21.
//

import SwiftUI

struct CoverImageView: View {
  let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
  
  var body: some View {
    TabView {
      ForEach(coverImages) { item in
        Image(item.name)
          .resizable()
        .scaledToFit()
      } // Loop
    } // Tab
    .tabViewStyle(PageTabViewStyle())
  }
}

struct CoverImageView_Previews: PreviewProvider {
  static var previews: some View {
    CoverImageView()
      .previewLayout(.fixed(width: 400, height: 300))
  }
}
