//
//  WeatherError.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/19/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import Foundation
public struct WeatherError {

    var message: String = "Unknown Error"
    init() {

    }
    init(withDictionary dictionary: NSDictionary) {

        let errorArray = dictionary["error"]
        let errorElement = (errorArray as? NSArray)?[0] as! NSDictionary

        // Parsing
        self.message = errorElement["msg"] as! String
    }

    init(withError error: Error) {
        self.message = error.localizedDescription
    }
}
