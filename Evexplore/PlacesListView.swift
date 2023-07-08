//
//  PlacesListView.swift
//  Evexplore
//
//  Created by Paul on 26.06.23.
//

import Foundation
import SwiftUI

struct PlacesListView: View {
    
    var nearbyPOIs: NearbyPlaces?
    
    var body: some View {
        NavigationView {
            if (nearbyPOIs != nil) {
                // List POIs sorted by distance
                List(nearbyPOIs!.results.sorted(by: { $0.distance < $1.distance })) { nearbyPOI in
                    NavigationLink(destination: PlaceDetailView(place: nearbyPOI)) {
                        HStack {
                            Text(nearbyPOI.name)
                            Spacer()
                            Text("\(nearbyPOI.distance)m")
                                .font(.caption)
                        }
                    }
                }
                .navigationTitle("Nearby Places")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
    }
}
