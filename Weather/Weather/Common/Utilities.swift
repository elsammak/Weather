//
//  Utilities.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// Utilities class contains methods to be used anywhere in the app.
import Foundation
private let sugesstionsArrayKey = "SugesstionsArray"

class Utilities {

    var suggestionsArray: [String] = []

    static let sharedInstance: Utilities = {
        let instance = Utilities()
        return instance
    }()

    private init() {

    }

    public func saveNewSuggestion(query: String) {
        suggestionsArray.append(query)
        UserDefaults.standard.set(suggestionsArray, forKey: sugesstionsArrayKey)
        UserDefaults.standard.synchronize()
    }

    public func loadSugesstionsArray() {

        if let returnValue = UserDefaults.standard.object(forKey: sugesstionsArrayKey) as? [String] {
            suggestionsArray = returnValue
        } else {
            suggestionsArray = []
        }
    }
}
