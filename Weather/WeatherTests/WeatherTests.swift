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

}
