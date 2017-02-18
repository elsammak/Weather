//
//  WeatherEntry.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// WeatherEntry object clas which contains attributes to display
import Foundation
public struct WeatherEntry {

    var cityName: String?
    var weatherIcon: String?
    var humidity: String?
    var weatherDescription: String?
    var observationTime: String?

    init(withDictionary dictionary: NSDictionary) {

        // Request part (first part of returned JSON)
        let requestArray = (dictionary["data"] as? NSDictionary)?["request"]
        let requestElement = (requestArray as? NSArray)?[0] as! NSDictionary

        // Parsing
        self.cityName = requestElement["query"] as? String

        // Current_Condition part (second part of returned JSON)
        let currentConditionArray = (dictionary["data"] as? NSDictionary)?["current_condition"]
        let currentConditionElement = (currentConditionArray as? NSArray)?[0] as! NSDictionary

        // Parsing
        self.observationTime = currentConditionElement["observation_time"] as? String
        self.weatherIcon = ((currentConditionElement["weatherIconUrl"] as? NSArray)?[0] as? NSDictionary)?.value(forKey: "value") as? String
        self.humidity = currentConditionElement["humidity"] as? String
        self.weatherDescription = ((currentConditionElement["weatherDesc"] as? NSArray)?[0] as? NSDictionary)?.value(forKey: "value") as? String
    }

}
