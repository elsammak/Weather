//
//  WeatherViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import UIKit

private let suggestionsVCSegueID = "SuggestionsSegueIdentifier"

class WeatherViewController: AbstractViewController, WeatherDataDelegate, UISearchBarDelegate {

    // IBOutlets
    @IBOutlet weak var suggestionsContainerView: UIView!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!

    // ViewModel instance
    var viewModel: WeatherViewModel!

    var suggestionsTableViewController: SuggestionsTableViewController?

    // MARK: - View Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WeatherViewModel()
        viewModel.delegate = self
    }

    // MARK: - WeatherDataDelegate methods
    func updateUIWithData(weatherEntry: WeatherEntry) {

        weatherDescriptionLabel.text = weatherEntry.weatherDescription
    }

    func updateUIWithError(error: Error) {

    }

    // MARK: - UISearchBarDelegate
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {

        // Check for suggestions array if empty
        if Utilities.sharedInstance.suggestionsArray.count > 0 {
            suggestionsContainerView.alpha = 1
            suggestionsTableViewController?.tableView.reloadData()
        }
        return true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()

        if let searchQuery = searchBar.text {
            viewModel.getWeatherInformation(forLocation: searchQuery)
        }

    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == suggestionsVCSegueID {

            suggestionsTableViewController = segue.destination as? SuggestionsTableViewController
        }
    }
}
