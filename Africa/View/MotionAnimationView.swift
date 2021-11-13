//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Arthur Neves on 13/11/21.
//

import SwiftUI

struct MotionAnimationView: View {
  @State private var randomCircle = Int.random(in: 12...16)
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Circle()
          .foregroundColor(.gray)
          .opacity(0.15)
          .frame(width: 256, height: 256, alignment: .center)
          .position(
            x: geometry.size.width / 2,
            y: geometry.size.height / 2)
        Text("Width \(Int(geometry.size.width)) Height: \(Int(geometry.size.height))")
      } //: ZStack
    } //: GeometryReader
  }
}

struct MotionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    MotionAnimationView()
  }
}
