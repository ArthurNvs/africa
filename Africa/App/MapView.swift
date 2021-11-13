//
//  MapView.swift
//  Africa
//
//  Created by Arthur Neves on 10/11/21.
//

import SwiftUI
import MapKit

struct MapView: View {
  
  @State private var region: MKCoordinateRegion = {
    var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    
    return mapRegion
  }()
  
  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  
  var body: some View {
    // MARK: - Basic Map
    //Map(coordinateRegion: $region)
    
    // MARK: - Advanced Map
    Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
      // (A) PIN: OLD STYLE (always static)
      //MapPin(coordinate: item.location, tint: .accentColor)
      
      // (B) MARKER: NEW STYLE (always static)
      //MapMarker(coordinate: item.location, tint: .accentColor)
      
      // (C) CUSTOM BASIC ANNOTATION (could be interactive)
      MapAnnotation(coordinate: item.location) {
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32, alignment: .center)
      } //: MapAnnotation
    })
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
