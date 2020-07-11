//
//  CurrentLocationViewController.swift
//  WeatherForecasting
//
//  Created by prathibha sundresh on 10/07/20.
//  Copyright © 2020 prathibha sundresh. All rights reserved.
//

import UIKit
//import CoreLocation

class CurrentLocationViewController: UIViewController {
    
    var locationModel:GeoLocationClass!
    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationModel = GeoLocationClass()
        locationModel.fetchCurrentLocation()
        locationModel.dataDelegate = self
        // Do any additional setup after loading the view.
    }
}

extension CurrentLocationViewController: weatherForeCastingDataProtocol {
    func displayWeatherForeCastingData() {
        DispatchQueue.main.async() {
            self.tableView.reloadData()
            self.navigationItem.title = self.locationModel.modelData!.city.name
        }
    }
}

extension CurrentLocationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rowCount = locationModel.modelData {
            return rowCount.list.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForeCastingTableViewCellID") as? WeatherForeCastingTableViewCell {
            cell.setUpView(data: locationModel.modelData!.list[indexPath.row])
            return cell
        } else {
            let  cell = WeatherForeCastingTableViewCell(style: .default, reuseIdentifier: "WeatherForeCastingTableViewCellID")
            cell.setUpView(data: locationModel.modelData!.list[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
