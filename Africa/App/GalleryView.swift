//
//  GalleryView.swift
//  Africa
//
//  Created by Arthur Neves on 10/11/21.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        Text("Gallery")
      } //: ScrollView
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
