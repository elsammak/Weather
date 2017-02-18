//
//  ViewController.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherDataDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK:- WeatherDataDelegate methods
    func updateUIWithData(weatherEntry: WeatherEntry) {
        
    }

    func updateUIWithError(error: Error) {
        
    }
}
