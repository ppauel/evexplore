//
//  NetworkManagerTests.swift
//  EvexploreTests
//
//  Created by Paul on 08.07.23.
//

import XCTest
@testable import Evexplore

final class NetworkManagerTests: XCTestCase {

    func testSuccessfulAPICall() async {
        // Given
        let location = AppConfig.evenlyHQ
        let closestPOI = "560d09a0498e04e7a4318441"
        let limit: Int32 = 50
        
        // When
        let nearbyPOIs = try? await NetworkManager().getNearbyLocations(at: location, withLimit: limit)
        
        // Then
        XCTAssertEqual(nearbyPOIs?.results.first?.fsqId, closestPOI)
    }

}
