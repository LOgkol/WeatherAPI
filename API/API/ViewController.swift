//
//  ViewController.swift
//  API
//
//  Created by Alex on 11/28/20.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var fellsLikeLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    var weather: StructWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherRoot.loadWeatherData { [weak self] weather in
            guard let self = self, let weather = weather else {return}
            self.updateInterface(with: weather)
        }
    }
    
    private func updateInterface(with weather: StructWeather) {
        DispatchQueue.main.async {
            let weatherMainData = weather.list.first?.main
            self.cityNameLabel.text = weather.city.name
            self.tempLabel.text = weatherMainData?.tempString
            self.fellsLikeLabel.text = weatherMainData?.feelslikeString
            self.humidityLabel.text = weatherMainData?.humidityString
        }
    }
}
