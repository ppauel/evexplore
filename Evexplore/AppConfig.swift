//
//  Config.swift
//  Evexplore
//
//  Created by Paul on 26.06.23.
//

import Foundation
import CoreLocation

let processInfo = ProcessInfo.processInfo

struct AppConfig {
    static let FsqApiEndpoint = "https://api.foursquare.com/v3"
    static let FsqShareEndpoint = "https://foursquare.com/v"
    static let FsqEvenlyId = "560d09a0498e04e7a4318441"
    static let evenlyHQ = CLLocationCoordinate2D(latitude: 52.500342, longitude: 13.425170)
    static let apiKey = processInfo.environment["apiKey"] ?? "" // Put API key here to test on external device
}
