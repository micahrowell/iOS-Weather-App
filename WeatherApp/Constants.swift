//
//  Constants.swift
//  WeatherApp
//
//  Created by Micah Rowell on 7/30/17.
//  Copyright © 2017 Micah Rowell. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q="
let LATITUDE = "lat=97.7431"
let LONGITUDE = "&lon=32.2672"
let CITY = "Austin"
let APP_ID = "&appid="
let API_KEY = "295a2a800def02df7077e0569516ee9b"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(CITY)\(APP_ID)\(API_KEY)"
