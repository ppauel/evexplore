//
//  PlaceDetailView.swift
//  Evexplore
//
//  Created by Paul on 26.06.23.
//

import Foundation
import SwiftUI

struct PlaceDetailView: View {
    
    let place: NearbyPlace?
    
    var body: some View {
        VStack {
            // TODO: Get Icon URL
            AsyncImage(url: place?.categories.first?.icon.iconURL()) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "mappin.circle.fill")
                    .resizable()
                    .foregroundStyle(.white, .red)
            }
            .frame(width: 120, height: 120)
            .padding()
            List {
                HStack {
                    Text("Category")
                    Spacer()
                    Text(place?.categories.first?.name ?? "Unknown category")
                        .font(.caption2)
                }
                HStack {
                    Text("Address")
                    Spacer()
                    Link(place?.location.formattedAddress ?? "Unknown address", destination: URL(string: "maps://?saddr=&daddr=\(place?.geocodes.main.latitude ?? 0),\(place?.geocodes.main.longitude ?? 0)")!)
                        .font(.caption2)
                }
                HStack {
                    Spacer()
                    ShareLink("Share Link", item: URL(string: "\(AppConfig.FsqShareEndpoint)/\(place?.fsqId ?? "")")!)
                        .font(.headline)
                    Spacer()
                }
                .padding()
            }
            Spacer()
        }
        .navigationTitle(place?.name ?? "Name")
        .navigationBarTitleDisplayMode(.inline)
    }
}
