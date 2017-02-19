//
//  WeatherViewControllerDelegate.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/19/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// Protocol for the main WeatherViewController view.
import Foundation
protocol WeatherViewControllerDelegate: class {
    /**
     Get weather information for query.
     
     - parameter location: Query user entered.
     */
    func getWeatherInfo(forLocation location: String)

    /// Update last retrieved data. 
    func update()
}
