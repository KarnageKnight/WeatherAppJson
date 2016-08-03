//
//  ViewController.swift
//  WeatherAppJSON
//
//  Created by KarnageKnight on 03/08/16.
//  Copyright © 2016 KarnageKnight. All rights reserved.
//

import UIKit

class ViewController: UIViewController,weatherGetterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var weather = weatherGetter(delegate: self)
        weather.getWeatherByCity("Faridabad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didGetWeather(weather: Weather) {
        dispatch_async(dispatch_get_main_queue()){
            
        }
        print(weather.dateAndTime)
        print(weather.mainWeather)
    }
    
    func didNotGetWeather(error: NSError) {
        dispatch_async(dispatch_get_main_queue()){
            
        }
        print("Did not get weather data \(error)")
    }
}

