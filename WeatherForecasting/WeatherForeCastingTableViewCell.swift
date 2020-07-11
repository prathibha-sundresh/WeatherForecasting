//
//  WeatherForeCastingTableViewCell.swift
//  WeatherForecasting
//
//  Created by prathibha sundresh on 11/07/20.
//  Copyright © 2020 prathibha sundresh. All rights reserved.
//

import UIKit

class WeatherForeCastingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var temperature:UILabel!
    @IBOutlet weak var weatherDescription:UILabel!
    @IBOutlet weak var windSpeed:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpView(data : List) {
        temperature.text! = "Temp Min: \(data.main.tempmin) , TempMax: \(data.main.tempmax)"
        weatherDescription.text! = "Description: \(data.weather[0].description)"
        windSpeed.text! = "WindSpeed: \(data.wind.speed)"
        
    }

}
