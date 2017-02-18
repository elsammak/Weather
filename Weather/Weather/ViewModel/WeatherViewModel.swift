//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// The ViewModel layer is responsible for handling events to Model layer and send updates to UI/view layer.

import Foundation

/// UI Delegate methods, used to update UI/view Layer with objects/error
protocol WeatherDataDelegate: class {
    func updateUIWithData(weatherEntry: WeatherEntry)
    func updateUIWithError(error: Error)
}

class WeatherViewModel {
    public weak var delegate: WeatherDataDelegate!
    
    // MARK:- APIs methods
    /**
     Get weather information for location.
     
     - parameter location: String represents query user entered.          
     */
    func getWeatherInformation(forLocation location: String) {
        WeatherEntryManager.sharedInstance.getWeatherInformation(forQuery: location) { (weatherEntry, error) in
            guard let weatherEntry = weatherEntry else { // Update UI with error
                self.delegate.updateUIWithError(error: error!)
                return
            }
            
            // Update UI with WeatherEntry data
                self.delegate.updateUIWithData(weatherEntry: weatherEntry)
        }
    }
}
