//
//  WeatherViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import UIKit

private let cellIdentifier = "SuggestionsCellID"

class WeatherViewController: AbstractViewController, WeatherDataDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    // IBOutlets
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var suggestionsTableView: UITableView!

    @IBOutlet weak var searchBar: UISearchBar!
    // ViewModel instance
    var viewModel: WeatherViewModel!

    // Properties
    var suggestionsArray: [String] = []
    // MARK: - View Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WeatherViewModel()
        viewModel.delegate = self
        suggestionsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    // MARK: - WeatherDataDelegate methods
    func updateUIWithData(weatherEntry: WeatherEntry) {

        weatherDescriptionLabel.text = weatherEntry.weatherDescription
    }

    func updateUIWithError(error: Error) {

    }

    // MARK: - UISearchBarDelegate
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {

        suggestionsArray = Utilities.sharedInstance.suggestionsArray
        // Check for suggestions array if empty
        if suggestionsArray.count > 0 {
            suggestionsTableView.alpha = 1
            suggestionsTableView.reloadData()
        }
        return true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchQuery = searchBar.text {
            viewModel.getWeatherInformation(forLocation: searchQuery)
        }
        resetSearch()
    }

    // MARK: - UITableview DataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestionsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = suggestionsArray[indexPath.row]
        return cell
    }
    // MARK: - UITableview Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getWeatherInformation(forLocation: suggestionsArray[indexPath.row])
        resetSearch()
    }

    // Private helpers
    fileprivate func resetSearch() {
        suggestionsTableView.alpha = 0
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

}
