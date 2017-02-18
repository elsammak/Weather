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
        if isQueryExisted(query: query) {
            return
        }

        suggestionsArray.insert(query, at: 0)
        if suggestionsArray.count == maxNumberOfStoredSuggestions + 1 {
            suggestionsArray.removeLast()
        }
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

    fileprivate func isQueryExisted(query: String) -> Bool {

        for storedQuery in suggestionsArray {
            if storedQuery.lowercased() == query.lowercased() {
                return true
            }
        }
        return false
    }
}
