//
//  CoverImageView.swift
//  Africa
//
//  Created by Arthur Neves on 10/11/21.
//

import SwiftUI

struct CoverImageView: View {
  var body: some View {
    TabView {
      ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
        Image("cover-lion")
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
