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
protocol WeatherDataDelegate: AbstractDataDelegate {
    func updateUIWithData(weatherEntry: WeatherEntry)
}

class WeatherViewModel: AbstractViewModel {
    public weak var delegate: WeatherDataDelegate!
    var currentLocation: String?

    // MARK: - Updates
    override func update() {
        guard let location = currentLocation else {
            return
        }
        // Start sending request
        getWeatherInformation(forLocation: location)
    }

    // MARK: - APIs methods
    /**
     Get weather information for location.
     
     - parameter location: String represents query user entered.          
     */
    func getWeatherInformation(forLocation location: String) {
        currentLocation = location
        
        // Notify delegate that loading will start
        delegate.willUpdateData()
        
        WeatherEntryManager.sharedInstance.getWeatherInformation(forQuery: location) { [unowned self] (result, error) in
            guard let result = result else { // Update UI with error
                self.delegate.updateUIWithError(error: error!)
                return
            }

            if result is WeatherEntry {
                // Update UI with WeatherEntry data
                self.delegate.updateUIWithData(weatherEntry: result as! WeatherEntry)
                
                // Update and save suggestionsArray
                Utilities.sharedInstance.saveNewSuggestion(query: location)
                
            } else if result is WeatherError {
                self.delegate.updateUIWithError(error: result as! WeatherError)
            }
        }
    }
}
