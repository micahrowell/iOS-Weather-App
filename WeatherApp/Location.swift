//
//  Location.swift
//  WeatherApp
//
//  Created by Micah Rowell on 8/1/17.
//  Copyright © 2017 Micah Rowell. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
