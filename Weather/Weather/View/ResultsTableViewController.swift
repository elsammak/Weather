//
//  ResultsTableViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/19/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// This TableViewController used to display weather information, it's used as an embeeded view inside WeatherViewController.
import UIKit

private let resultCellID = "ResultCellID"

class ResultsTableViewController: UITableViewController {

    // Properties
    public weak var delegate: WeatherViewControllerDelegate!

    var weatherEntry: WeatherEntry? {
        didSet {
            self.refreshControl?.endRefreshing()
            tableView.reloadData()
        }
    }

    // MARK: - View cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: resultCellID)

        self.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resultCellID, for: indexPath) as! ResultTableViewCell

        guard let weatherEntry = weatherEntry else { return cell }

        cell.updateUI(weatherEntry: weatherEntry)
        return cell
    }

    // MARK: - Private helpers

    /// Refresh when pull down table view.     
    @objc fileprivate func refresh() {
        guard let _ = weatherEntry else {
            self.refreshControl?.endRefreshing()
            return
        }
        delegate.update()
    }

}
