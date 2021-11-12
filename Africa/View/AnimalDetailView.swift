//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Arthur Neves on 11/11/21.
//

import SwiftUI

struct AnimalDetailView: View {
  let animal: Animal
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        // Hero Image
        Image(animal.image)
          .resizable()
          .scaledToFit()
        
        // Title
        Text(animal.name.uppercased())
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .padding(.vertical, 8)
          .foregroundColor(.primary)
          .background(
            Color.accentColor
              .frame(height: 6)
              .offset(y: 24)
          )
        
        // Headline
        Text(animal.headline)
          .font(.headline)
          .multilineTextAlignment(.leading)
          .foregroundColor(.accentColor)
          .padding(.horizontal)
        
        // Gallery
        Group {
          HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
          
          InsetGalleryView(animal: animal)
        }
        .padding(.horizontal)
        
        // Facts
        Group {
          HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
          
          InsetFactView(animal: animal)
        }
        
        // Description
        Group {
          HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
          
          Text(animal.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
        }
        .padding(.horizontal)
        
        // Map
        Group {
          HeadingView(headingImage: "map", headingText: "National Parks")
          
          InsetMapView()
        }
        .padding(.horizontal)
        
        // Link
      } //: VStack
      .navigationTitle(Text("Learn about \(animal.name)"))
      .navigationBarTitleDisplayMode(.inline)
    } //: ScrollView
  }
}

struct AnimalDetailView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    AnimalDetailView(animal: animals[0])
  }
}
