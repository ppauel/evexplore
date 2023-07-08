//
//  MapView.swift
//  Evexplore
//
//  Created by Paul on 26.06.23.
//

import Foundation
import SwiftUI
import MapKit

struct PlacesMapView: View {
    
    var nearbyPOIs: NearbyPlaces?
    
    @State private var region = MKCoordinateRegion(
        center: AppConfig.evenlyHQ,
        span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
    )
    
    var body: some View {
        
        let locations = nearbyPOIs?.results.map { result in
            Location(name: result.fsqId, coordinate: CLLocationCoordinate2D(latitude: result.geocodes.main.latitude, longitude: result.geocodes.main.longitude))
        } ?? []
        
        NavigationView {
            Map(coordinateRegion: $region, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        PlaceDetailView(place: (nearbyPOIs?.results.first(where: { $0.fsqId == location.name })))
                    } label: {
                        if (location.name == AppConfig.FsqEvenlyId) {
                            Image(systemName: "house.circle.fill")
                                .resizable()
                                .foregroundStyle(.white, .blue)
                                .frame(width: 42, height: 42)
                                .overlay(Circle()
                                    .stroke(Color.white, lineWidth: 2))
                            
                        } else {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .foregroundStyle(.white, .red)
                                .frame(width: 36, height: 36)
                                .overlay(Circle()
                                    .stroke(Color.white, lineWidth: 2))
                        }
                    }
                }
            }
            .ignoresSafeArea(.container, edges: .top)
        }
    }
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
