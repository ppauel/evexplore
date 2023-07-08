//
//  ContentView.swift
//  Evexplore
//
//  Created by Paul on 26.06.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var nearbyPOIs: NearbyPlaces?
    
    var body: some View {
        TabView {
            PlacesMapView(nearbyPOIs: nearbyPOIs)
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            PlacesListView(nearbyPOIs: nearbyPOIs)
                .tabItem {
                    Label("List", systemImage: "list.star")
                }
        }
        // Async API call
        .task {
            do {
                nearbyPOIs = try await NetworkManager().getNearbyLocations(at: AppConfig.evenlyHQ, withLimit: 50)
            }
            catch FsqError.invalidURL {
                print("Invalid URL")
            }
            catch FsqError.invalidData {
                print("Invalid data")
            }
            catch FsqError.invalidResponse {
                print("Invalid response")
            }
            catch {
                print("Unexpected error")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
