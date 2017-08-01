//
//  Constants.swift
//  WeatherApp
//
//  Created by Micah Rowell on 7/30/17.
//  Copyright © 2017 Micah Rowell. All rights reserved.
//

import Foundation

let API_KEY = "295a2a800def02df7077e0569516ee9b"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&mode=json&appid=\(API_KEY)"
