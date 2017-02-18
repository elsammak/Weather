//
//  WeatherViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import UIKit

class WeatherViewController: AbstractViewController, WeatherDataDelegate, UISearchBarDelegate {

    // IBOutlets
    @IBOutlet weak var suggestionsContainerView: UIView!
    
    var suggestionsTableViewController: SuggestionsTableViewController?
    
    // MARK: - View Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - WeatherDataDelegate methods
    func updateUIWithData(weatherEntry: WeatherEntry) {

    }

    func updateUIWithError(error: Error) {

    }

    // MARK: - UISearchBarDelegate
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {

        // Check for suggestions array if empty
        if Utilities.sharedInstance.suggestionsArray.count >= 0 {
            suggestionsContainerView.alpha = 1
        }
        return true
    }
    
    // MARK:- Navigation
    
}
