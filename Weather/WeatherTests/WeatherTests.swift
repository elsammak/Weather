//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAPIClient() {
        let apiClient = APIClient()
        let asyncApiCallExpectation = self.expectation(description: "asyncApiCallExpectation")

        apiClient.getWeather(forLocation: "London") { (dictionary, error) in

            XCTAssertNotNil(dictionary)
            let requestArray = (dictionary?["data"] as? NSDictionary)?["request"]
            let requestElement = (requestArray as? NSArray)?[0] as! NSDictionary
            XCTAssertEqual(requestElement["query"] as! String, "London", "Returns data for \(requestElement["query"])")
            XCTAssertNil(error)
            asyncApiCallExpectation.fulfill()
        }
        self.waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error)
        }
    }

    //***** Must be changed to match current condition before testing ***//
    func testWeatherManager() {

        let asyncApiCallExpectation = self.expectation(description: "asyncApiCallExpectation")

        WeatherEntryManager.sharedInstance.getWeatherInformation(forQuery: "London") { (result, error) in

            let weatherEntry = result as! WeatherEntry
            XCTAssertEqual(weatherEntry.cityName, "London", "WeatherEntry has \(weatherEntry.cityName) as cityName")
            XCTAssertEqual(weatherEntry.humidity, "67", "Current humidity \(weatherEntry.humidity)")
            XCTAssertEqual(weatherEntry.weatherDescription, "Partly cloudy", "Current Desc \(weatherEntry.weatherDescription)")
            XCTAssertNil(error)
            asyncApiCallExpectation.fulfill()
        }
        self.waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error)
        }
    }

    func testError() {

        let asyncApiCallExpectation = self.expectation(description: "asyncApiCallExpectation")

        WeatherEntryManager.sharedInstance.getWeatherInformation(forQuery: "qwert5432") { (result, error) in

            let weatherError = result as! WeatherError

            XCTAssertEqual(weatherError.message, "Unable to find any matching weather location to the query submitted!", "Error mesage: \(weatherError.message)")

            XCTAssertNil(error)
            asyncApiCallExpectation.fulfill()
        }
        self.waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error)
        }
    }
}
