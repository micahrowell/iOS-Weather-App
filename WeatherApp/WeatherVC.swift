//
//  ViewController.swift
//  WeatherApp
//
//  Created by Micah Rowell on 7/29/17.
//  Copyright © 2017 Micah Rowell. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        
                    }
                    
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                    
                }
                
            }
            
            completed()
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return forecasts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            
            return cell

        } else {
            
            return WeatherCell()
            
        }
        
    }
    
    func updateMainUI() {
        
        dateLabel.text = currentWeather.date
        tempLabel.text = "\(currentWeather.currentTemp)°"
        weatherLabel.text = currentWeather.weatherType
        locLabel.text = currentWeather.cityName
        weatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }

}

