//
//  VideoListView.swift
//  Africa
//
//  Created by Arthur Neves on 10/11/21.
//

import SwiftUI

struct VideoListView: View {
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          VideoListItemView(video: item)
            .padding(.vertical, 8)
        }
      }//: List
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            videos.shuffle()
          }) {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    }//: Navigation
  }
}

struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
  }
}
