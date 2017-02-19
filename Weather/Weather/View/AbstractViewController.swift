//
//  AbstractViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// Super ViewController for all ViewControllers in this target.
import UIKit

class AbstractViewController: UIViewController, AbstractDataDelegate {

    // MARK: - View Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - AbstractDataDelegate Methods
    func updateUIWithError(error: WeatherError) {

    }

    func willUpdateData() {

    }

}
