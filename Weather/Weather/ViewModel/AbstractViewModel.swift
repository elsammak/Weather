//
//  AbstractViewModel.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// The Superclass for all ViewModels classes
import Foundation

protocol AbstractDataDelegate: class {
    func willUpdateData()
    func updateUIWithError(error: WeatherError)
}

class AbstractViewModel {

    func update() { // Do any task pefore updating any request

    }
}
