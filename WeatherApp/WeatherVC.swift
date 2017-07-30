//
//  ViewController.swift
//  WeatherApp
//
//  Created by Micah Rowell on 7/29/17.
//  Copyright © 2017 Micah Rowell. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather.downloadWeatherDetails {
            self.updateMainUI()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
        
    }
    
    func updateMainUI() {
        
        dateLabel.text = currentWeather.date
        tempLabel.text = "\(currentWeather.currentTemp)°"
        weatherLabel.text = currentWeather.weatherType
        locLabel.text = currentWeather.cityName
        weatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }

}

