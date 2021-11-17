//
//  GalleryView.swift
//  Africa
//
//  Created by Arthur Neves on 10/11/21.
//

import SwiftUI

struct GalleryView: View {
  
  @State private var selectedAnimal: String = "lion"
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  // let gridLayout: [GridItem] = [
  //   GridItem(.flexible()),
  //   GridItem(.flexible()),
  //   GridItem(.flexible())
  // ]
  
  // Efficient grid definition
  //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
  
  // Dynamic grid layout
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  
  @State private var number: Int = 1
  
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    number = gridLayout.count
  }
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 30) {
        Image(selectedAnimal)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay(Circle().stroke(Color.white, lineWidth: 8))
        
        Slider(value: $gridColumn, in: 2...4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumn, perform: { value in
            gridSwitch()
            haptics.impactOccurred()
          })
        
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(animals) { item in
            Image(item.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 1))
              .onTapGesture {
                selectedAnimal = item.image
                haptics.impactOccurred()
              }
          } //: ForEach
        } //: LazyVGrid
        .animation(.easeIn(duration: 0.5), value: number)
        .onAppear(perform: {
          gridSwitch()
        })
      } //: VStack
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
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
