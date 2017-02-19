//
//  WeatherError.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/19/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// WeatherError is the Error object used for this application.
import Foundation
public struct WeatherError {

    var message: String = "Unknown Error"
    init() {

    }
    /**
     Used when server reply with error.
     
     - parameter error: dictionary contains JSON data.
     */
    init(withDictionary dictionary: NSDictionary) {

        let errorArray = dictionary["error"]
        let errorElement = (errorArray as? NSArray)?[0] as! NSDictionary

        // Parsing
        self.message = errorElement["msg"] as! String
    }
    /**
     Used when a native erorr occured.
     
     - parameter error: Erorr object.
     */
    init(withError error: Error) {
        self.message = error.localizedDescription
    }
}
