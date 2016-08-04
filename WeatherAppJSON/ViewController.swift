//
//  ViewController.swift
//  WeatherAppJSON
//
//  Created by KarnageKnight on 03/08/16.
//  Copyright © 2016 KarnageKnight. All rights reserved.
//

import UIKit

class ViewController: UIViewController,weatherGetterDelegate,UITextFieldDelegate {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cloudCoverLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var getCityWeatherButton: UIButton!
    
    var weather:weatherGetter!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var weather = weatherGetter(delegate: self)
        //Test code
       // weather.getWeatherByCity("Tampa")
        
        
        cityLabel.text = "simple weather"
        weatherLabel.text = ""
        temperatureLabel.text = ""
        cloudCoverLabel.text = ""
        windLabel.text = ""
        rainLabel.text = ""
        humidityLabel.text = ""
        cityTextField.text = ""
        cityTextField.placeholder = "Enter city name"
        cityTextField.delegate = self
        cityTextField.enablesReturnKeyAutomatically = true
        getCityWeatherButton.enabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getWeatherButtonTapped(sender:UIButton){
        let city=cityTextField.text
        var weather = weatherGetter(delegate: self)
        weather.getWeatherByCity(city!)
    }

    func didGetWeather(weather: Weather) {
        dispatch_async(dispatch_get_main_queue()){
            
        }
    }
    
    func didNotGetWeather(error: NSError) {
        dispatch_async(dispatch_get_main_queue()){
            
        }
        print("Did not get weather data \(error)")
    }
}

