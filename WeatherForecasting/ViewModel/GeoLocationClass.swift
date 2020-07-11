//
//  CurrentLocationViewModel.swift
//  WeatherForecasting
//
//  Created by prathibha sundresh on 10/07/20.
//  Copyright © 2020 prathibha sundresh. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

protocol weatherForeCastingDataProtocol {
    func displayWeatherForeCastingData()
}

class GeoLocationClass: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var modelData : WeatherForeCastingForCurrentCityData!
    var dataDelegate : weatherForeCastingDataProtocol!
    
    func fetchCurrentLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = locations.last else { return }
        fetchCityAndCountry(from: location) { city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            self.locationManager.stopUpdatingLocation()
            self.locationManager.delegate = nil;
            print(city + ", " + country)
            self.callAPIToFetchWeatherForcasting(cityName: city)
        }
    }
    
    private func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print(error as Any)
    }
    
    func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality,
                       placemarks?.first?.country,
                       error)
        }
    }
    
    func callAPIToFetchWeatherForcasting(cityName:String) {
        let api = kAPI_currentCity.replacingOccurrences(of: "{city_name}", with: cityName)
        UtilityClass.fetchWeatherForecastingData(url: URL(string: api)!, completion: {[weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let weatherForecasrtingData):
                print(weatherForecasrtingData)
                self.modelData = weatherForecasrtingData
                self.dataDelegate?.displayWeatherForeCastingData()
            case .failure(let error):
                print(error)
            }
        })
    }
    
}
