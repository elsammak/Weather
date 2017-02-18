//
//  SuggestionsTableViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import UIKit

class SuggestionsTableViewController: UITableViewController {

    let suggestionsArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return suggestionsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCellID", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = suggestionsArray[indexPath.row]
        return cell
    }

}
