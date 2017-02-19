//
//  AbstractViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import UIKit

class AbstractViewController: UIViewController, AbstractDataDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - AbstractDataDelegate Methods
    func updateUIWithError(error: WeatherError) {

    }

    func willUpdateData() {

    }

}
