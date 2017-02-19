//
//  ResultTableViewCell.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/19/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    // IBOutlets
    @IBOutlet weak var observationTimeLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var weatherDescLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateUI(weatherEntry: WeatherEntry) {
        cityNameLabel.text = weatherEntry.cityName
        
        if let observationTime = weatherEntry.observationTime {
            observationTimeLabel.text = "Last observation at: \(observationTime)"
        }
        
        weatherDescLabel.text = weatherEntry.weatherDescription
        
        if let humidity = weatherEntry.humidity {
            humidityLabel.text = "Humidity: \(humidity)%"    
        }
        

        // Download image
        guard let url =  weatherEntry.weatherIcon else {
            return
        }
        let urlString = URL(string: url)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: urlString!)
            DispatchQueue.main.async {
                self.weatherIconImageView.image = UIImage(data: data!)
            }
        }
    }
}
