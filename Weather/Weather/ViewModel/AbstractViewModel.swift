//
//  AbstractViewModel.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// The Superclass for all ViewModels classes
import Foundation

/// Main protocol for all ViewControllers class, contains main functions to be used for any ViewControlelr and could be used as a parent protocol for any customization.
protocol AbstractDataDelegate: class {

    /// Update UI layer when about to update data, used for loading and preparing for coming data.
    func willUpdateData()
    /**
     Update UI layer with returned error .
     
     - parameter error: WeatherError object contains error message.
     */
    func updateUIWithError(error: WeatherError)
}

class AbstractViewModel {

    /// Do any task pefore updating any request
    func update() {

    }
}
