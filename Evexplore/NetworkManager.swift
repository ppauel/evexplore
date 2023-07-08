//
//  NetworkManager.swift
//  Evexplore
//
//  Created by Paul on 26.06.23.
//

import Foundation
import SwiftUI
import MapKit

struct NetworkManager {
    func getNearbyLocations(at location: CLLocationCoordinate2D, withLimit limit: Int32) async throws -> NearbyPlaces {
        let endpoint = "\(AppConfig.FsqApiEndpoint)/places/nearby?ll=\(location.latitude),\(location.longitude)&limit=\(limit)"
        guard let url = URL(string: endpoint) else { throw FsqError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(AppConfig.apiKey, forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FsqError.invalidResponse
        }
        
        do {
            // print(try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any])
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(NearbyPlaces.self, from: data)
        } catch {
            throw FsqError.invalidData
        }
    }
}

// Decodables

struct NearbyPlaces: Decodable {
    let results: [NearbyPlace]
}

struct NearbyPlace: Decodable, Identifiable {
    var id: String { fsqId } // id = fsqId
    let fsqId: String
    let name: String
    let distance: Int32
    let link: String
    let geocodes: PlaceGeocodes
    let categories: [PlaceCategory]
    let location: PlaceLocation
}

struct PlaceGeocodes: Decodable {
    let main: PlaceCoordinate
}

struct PlaceCoordinate: Decodable {
    let latitude: Double
    let longitude: Double
}

struct PlaceLocation: Decodable {
    let address: String
    let country: String
    let formattedAddress: String
}

struct PlaceCategory: Decodable {
    let id: Int
    let name: String
    let icon: PlaceIcon
}

struct PlaceIcon: Decodable {
    // TODO: Get icon via API
    let prefix: String
    let suffix: String
    func iconURL() -> URL {
        let urlString = "\(prefix)\(suffix)"
        let url = URL(string: urlString)!
        return url
    }
}

enum FsqError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
