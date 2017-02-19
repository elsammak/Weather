//
//  ResultsTableViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/19/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import UIKit

private let resultCellID = "ResultCellID"

class ResultsTableViewController: UITableViewController {

    var weatherEntry: WeatherEntry? {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: resultCellID)

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
}
