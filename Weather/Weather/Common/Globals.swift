//
//  Globals.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

/// Constants file which contains constants to be used across the whole target.
import Foundation

public let serverURL = "http://api.worldweatheronline.com/free/v1/weather.ashx?key=vzkjnx2j5f88vyn5dhvvqkzc&format=json"
typealias APILayerCompletion = (NSDictionary?, Error?) -> Void
typealias DataManagerLayerCompletion = (WeatherEntry?, Error?) -> Void
