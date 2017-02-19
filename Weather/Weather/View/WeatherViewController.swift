//
//  WeatherViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// Main WeatherViewController used to display weather data.
import UIKit

private let suggestionsSegueID = "SuggestionsSegue"
private let resultsSegueID = "ResultsSegue"

class WeatherViewController: AbstractViewController, WeatherDataDelegate, UISearchBarDelegate, WeatherViewControllerDelegate {

    // IBOutlets
    @IBOutlet weak var suggestionsContainerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loadingWheel: UIActivityIndicatorView!

    // ViewControllers
    var suggestionsTableVC: SuggestionsTableViewController?
    var resultsTableVC: ResultsTableViewController?

    // ViewModel instance
    var viewModel: WeatherViewModel!

    // MARK: - View Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WeatherViewModel()
        viewModel.delegate = self
        searchBar.becomeFirstResponder()
    }

    // MARK: - WeatherDataDelegate methods
    override func willUpdateData() {
        loadingWheel.startAnimating()
    }
    func updateUIWithData(weatherEntry: WeatherEntry) {

        loadingWheel.stopAnimating()
        resultsTableVC?.weatherEntry = weatherEntry
    }

    override func updateUIWithError(error: WeatherError) {
        super.updateUIWithError(error: error)
        loadingWheel.stopAnimating()

        let alert = UIAlertController(title:"Error",
                                      message: error.message,
                                      preferredStyle: UIAlertControllerStyle.alert)

        alert.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default, handler: { [unowned self] _ in
            self.viewModel.update()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - UISearchBarDelegate
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {

        // Check for suggestions array if empty
        if Utilities.sharedInstance.suggestionsArray.count > 0 {
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

    // MARK: - WeatherViewControllerDelegate methods
    func getWeatherInfo(forLocation location: String) {
        viewModel.getWeatherInformation(forLocation: location)
        resetSearch()
    }

    func update() {
        viewModel.update()
        resetSearch()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == suggestionsSegueID {
            suggestionsTableVC = segue.destination as? SuggestionsTableViewController
            suggestionsTableVC?.delegate = self
        } else if segue.identifier == resultsSegueID {
            resultsTableVC = segue.destination as? ResultsTableViewController
            resultsTableVC?.delegate = self
        }

    }

    // MARK: - Private helpers
    fileprivate func resetSearch() {
        suggestionsContainerView.alpha = 0
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
