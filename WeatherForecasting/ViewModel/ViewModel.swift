//
//  ViewModel.swift
//  WeatherForecasting
//
//  Created by prathibha sundresh on 09/07/20.
//  Copyright © 2020 prathibha sundresh. All rights reserved.
//

import Foundation

protocol weatherDataProtocol {
    func displayData()
}

class ViewModel : NSObject{
    
    var modelData : WeatherData!
    var dataDelegate : weatherDataProtocol!
    
    public func fetchData(WithCityName:String) {
        let api = kAPI.replacingOccurrences(of: "{city_name}", with: WithCityName)
           UtilityClass.fetchData(url: URL(string: api)!, completion: {[weak self] (result) in
               guard let self = self else { return }
               switch result {
               case .success(let weatherForecasrtingData):
               
                    self.modelData = weatherForecasrtingData
                    self.dataDelegate?.displayData()
//                } else {
//                    print("failure")
//                }
                
                  
               case .failure(let error):
                   print(error)
               }
           })
       }
    
    
    
}
