//
//  ContentView.swift
//  Africa
//
//  Created by Arthur Neves on 10/11/21.
//

import SwiftUI

struct ContentView: View {
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var isGridViewActive = false
  
  let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
  
  var body: some View {
    
    NavigationView {
      Group {
        if !isGridViewActive {
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(animals) { animal in
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              }
              .listRowBackground(Color.black)
            } //: ForEach
          }
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItemView(animal: animal)
                }
              } //: ForEach
            } //: LazyVGrid
            .padding(10)
            .animation(.easeIn)
          } //: ScrollView
        } //: List
      } //: Group
      .navigationBarTitle("Africa", displayMode: .large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {
            // LIST
            Button(action: {
              print("List view is activated")
              isGridViewActive = false
              haptics.impactOccurred()
            }) {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            }
            
            // GRID
            Button(action: {
              print("Grid view is activated")
              isGridViewActive = true
              haptics.impactOccurred()
            }) {
              Image(systemName: "square.grid.2x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
            }
          } //: HStack
        } //: Buttons/ToolbarItem
      } //: Toolbar
    } //: NavigationView
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
