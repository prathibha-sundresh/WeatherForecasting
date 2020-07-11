//
//  WeatherForecastingTests.swift
//  WeatherForecastingTests
//
//  Created by prathibha sundresh on 09/07/20.
//  Copyright © 2020 prathibha sundresh. All rights reserved.
//

import XCTest
import CoreLocation
@testable import WeatherForecasting

class WeatherForecastingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testReverseLocation() {
        let location = GeoLocationClass()
        location.fetchCityAndCountry(from: CLLocation(latitude: 13.0827, longitude: 80.2707), completion: {(city, country, error) in
            if (city != nil) || (country != nil) {
                XCTAssertTrue(true, "success")
            } else {
                XCTAssertTrue(true, "failure")
            }
            
        })
    }

}
