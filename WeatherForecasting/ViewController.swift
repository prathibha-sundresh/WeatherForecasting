//
//  ViewController.swift
//  WeatherForecasting
//
//  Created by prathibha sundresh on 09/07/20.
//  Copyright © 2020 prathibha sundresh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField:UITextField!
    @IBOutlet weak var temperatureLabel:UILabel!
    @IBOutlet weak var weatherDescriptionLabel:UILabel!
    @IBOutlet weak var windSpeedLabel:UILabel!
    
    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        isLabelHidden(display: true)
        viewModel.dataDelegate = self
        self.navigationItem.title = "Weather Forecasting"
    }
    
    @IBAction func fetchData() {
        if cityNameTextField.text!.count == 0 { return }
        viewModel.fetchData(WithCityName: cityNameTextField.text!)
    }
  
    @IBAction func FetchCurrentLocation() {
        performSegue(withIdentifier: "CuurentLocation", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}

extension ViewController :weatherDataProtocol {
    func HandleFailure() {
         DispatchQueue.main.async() {
            let alert = UIAlertController(title: "Alert", message: "There is some error occured for this city", preferredStyle: .alert)
            let alertaction = UIAlertAction(title: "OK", style: .default, handler: {(action:UIAlertAction) in
                
            })
            alert.addAction(alertaction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func displayData() {
        DispatchQueue.main.async() {
            self.isLabelHidden(display: false)
            self.temperatureLabel.text = "Temp Min: \(self.viewModel.modelData!.main.tempmin) , TempMax: \(self.viewModel.modelData!.main.tempmax)"
            self.weatherDescriptionLabel.text = "Description: \(self.viewModel.modelData!.weather[0].description)"
            self.windSpeedLabel.text = "WindSpeed: \(self.viewModel.modelData!.wind.speed)"
        }
    }
    
    func isLabelHidden(display:Bool) {
        temperatureLabel.isHidden = display
        windSpeedLabel.isHidden = display
        weatherDescriptionLabel.isHidden = display
    }
}

