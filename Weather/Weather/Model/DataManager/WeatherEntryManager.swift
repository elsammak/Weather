//
//  WeatherEntryManager.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// Act as a DataManager layer, perform parsing and control WeatherEntry Object. It also responsible for contacing APIClient layer.
import Foundation
class WeatherEntryManager {

    var apiClient: APIClient!

    static let sharedInstance: WeatherEntryManager = {
        let instance = WeatherEntryManager()
        return instance
    }()

    private init() {
        apiClient = APIClient()
    }
    /**
     Perform a request to get weather information for a single location.
     
     - parameter query: Acts as a location to get its weather information.
     
     - returns: WeatherEntry object or error.
     */
    public func getWeatherInformation(forQuery query: String, _ completion: @escaping DataManagerLayerCompletion) {
        apiClient.getWeather(forLocation: query) { (dictionary, error) in
            guard let dictionary = dictionary else { // Dictionary is nil, and error has occured
                completion(nil, error)
                return
            }
            // Parse dictionary to WeatherEntry object
            let weatherEntry = WeatherEntry(withDictionary: dictionary)
            completion(weatherEntry, nil)
        }
    }
}
