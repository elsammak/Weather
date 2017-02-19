//
//  SuggestionsTableViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/19/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// UITableViewController used to display suggestions when user tap the search bar.
import UIKit

private let cellIdentifier = "suggestionReuseID"

class SuggestionsTableViewController: UITableViewController {

    // Properties
    public weak var delegate: WeatherViewControllerDelegate!

    // MARK: - View cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Utilities.sharedInstance.suggestionsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        cell.textLabel?.text = Utilities.sharedInstance.suggestionsArray[indexPath.row]
        return cell
    }

    // MARK: - UITableview Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.getWeatherInfo(forLocation: Utilities.sharedInstance.suggestionsArray[indexPath.row])
    }
}
