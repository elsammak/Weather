//
//  WeatherViewControllerDelegate.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/19/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import Foundation
protocol WeatherViewControllerDelegate: class {
    func getWeatherInfo(forLocation location: String)
    func update()
}
