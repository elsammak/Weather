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
                let weatherError = WeatherError(withError: error!)
                completion(nil, weatherError)
                return
            }
            let resultDictionary = dictionary["data"] as! NSDictionary
            if resultDictionary.value(forKey: "request") != nil {
                // Parse dictionary to WeatherEntry object
                let weatherEntry = WeatherEntry(withDictionary: dictionary)
                completion(weatherEntry, nil)
            } else if resultDictionary.value(forKey: "error") != nil {
                // Parse dictionary to WeatherError object
                let weatherError = WeatherError(withDictionary: resultDictionary)
                completion(weatherError, nil)
            } else {
                completion(nil, WeatherError())
            }

        }
    }
}
