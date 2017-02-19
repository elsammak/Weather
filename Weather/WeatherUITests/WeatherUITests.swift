//
//  WeatherUITests.swift
//  WeatherUITests
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import XCTest

class WeatherUITests: XCTestCase {

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testUI() {

        let app = XCUIApplication()
        let searchField = app.searchFields["Search for location"]
        searchField.typeText("London")
        searchField.typeText("\n")
        checkForData("London") // Data displayed on UI

        // Check for suggestions
        searchField.tap()
        checkForData("London") // Data displayed Suggestion tableview
    }

    func checkForData(_ dataString: String) {

        //Wait till data retreived
        let app = XCUIApplication()
        let label = app.staticTexts[dataString]
        let exists = NSPredicate(format: "exists == 1")

        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

    }
}
