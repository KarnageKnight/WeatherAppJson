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
    
    var weather: weatherGetter!
    var city:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var weather = weatherGetter(delegate: self)
        //weather.getWeatherByCity("Faridabad")
        
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
        textFieldShouldReturn(cityTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getWeatherForCityButtonTapped(sender: UIButton) {
        city = cityTextField.text!
        var weather = weatherGetter(delegate: self)
        weather.getWeatherByCity(city)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

    func didGetWeather(weather: Weather) {
        dispatch_async(dispatch_get_main_queue()){
            self.cityLabel.text = self.city
            self.weatherLabel.text = weather.weatherDescription
            self.temperatureLabel.text = "\(Int(round(weather.tempCelsius)))°"
            self.cloudCoverLabel.text = "\(weather.cloudCover)%"
            self.windLabel.text = "\(weather.windSpeed) m/s"
            
            if let rain = weather.rainfallInLast3Hours {
                self.rainLabel.text = "\(rain) mm"
            }
            else {
                self.rainLabel.text = "None"
            }
            
            self.humidityLabel.text = "\(weather.humidity)%"
            print(weather.weatherDescription)
        }
    }
    
    func didNotGetWeather(error: NSError) {
        dispatch_async(dispatch_get_main_queue()){
          //  showSimpleAlert(title: "Can't get the weather",
            //                     message: "The weather service isn't responding.")
        }
        print("Did not get weather data \(error)")
    }
    
}
/*
func showSimpleAlert(title title: String, message: String) {
    let alert = UIAlertController(
        title: title,
        message: message,
        preferredStyle: .Alert
    )
    let okAction = UIAlertAction(
        title: "OK",
        style:  .Default,
        handler: nil
    )
    alert.addAction(okAction)
    presentViewController(
        alert,
        animated: true,
        completion: nil
    )
}
*/
