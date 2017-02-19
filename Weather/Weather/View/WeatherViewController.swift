//
//  WeatherViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import UIKit

private let suggestionsSegueID = "SuggestionsSegue"
private let resultsSegueID = "ResultsSegue"

class WeatherViewController: AbstractViewController, WeatherDataDelegate, UISearchBarDelegate, WeatherViewControllerDelegate {

    // IBOutlets
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var suggestionsContainerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // ViewControllers
    var suggestionsTableVC: SuggestionsTableViewController?
    var resultsTableVC: ResultsTableViewController?
    
    // ViewModel instance
    var viewModel: WeatherViewModel!

    // Properties
    var suggestionsArray: [String] = []
    
    // MARK: - View Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WeatherViewModel()
        viewModel.delegate = self        
    }

    // MARK: - WeatherDataDelegate methods
    func updateUIWithData(weatherEntry: WeatherEntry) {
        
        resultsTableVC?.wearherEntry = weatherEntry
        weatherDescriptionLabel.text = weatherEntry.weatherDescription
    }

    func updateUIWithError(error: Error) {

    }

    // MARK: - UISearchBarDelegate
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {

        suggestionsArray = Utilities.sharedInstance.suggestionsArray
        // Check for suggestions array if empty
        if suggestionsArray.count > 0 {
            suggestionsContainerView.alpha = 1
            suggestionsTableVC?.tableView.reloadData()
        }
        return true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchQuery = searchBar.text {
            viewModel.getWeatherInformation(forLocation: searchQuery)
        }
        resetSearch()
    }

    // MARK:- WeatherViewControllerDelegate methods
    func getWeatherInfo(forLocation location: String) {
        viewModel.getWeatherInformation(forLocation: location)
        resetSearch()
    }

    // Private helpers
    fileprivate func resetSearch() {
        suggestionsContainerView.alpha = 0
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == suggestionsSegueID {
            suggestionsTableVC = segue.destination as? SuggestionsTableViewController
            suggestionsTableVC?.delegate = self
        } else if segue.identifier == resultsSegueID {
            resultsTableVC = segue.destination as? ResultsTableViewController
        }
        
    }
}
