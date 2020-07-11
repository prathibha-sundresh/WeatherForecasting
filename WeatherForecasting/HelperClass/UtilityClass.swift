//
//  UtilityClass.swift
//  WeatherForecasting
//
//  Created by prathibha sundresh on 09/07/20.
//  Copyright © 2020 prathibha sundresh. All rights reserved.
//

import Foundation

class UtilityClass {
    
    private static func getData(url: URL,
                                completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: {data, response,error in
            completion(data, response, error)
        }).resume()
    }
    
    public static func fetchData(url: URL, completion: @escaping (Result<WeatherData,Error>) -> Void) {
        UtilityClass.getData(url: url, completion: { data,response,error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data , error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .millisecondsSince1970
                let json = try decoder.decode(WeatherData.self, from: data)
                completion(.success(json))
                
            } catch let error {
                completion(.failure(error))
            }
            
        })
    }
    
    public static func fetchWeatherForecastingData(url: URL, completion: @escaping (Result<WeatherForeCastingForCurrentCityData,Error>) -> Void) {
        UtilityClass.getData(url: url, completion: { data,response,error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data , error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .millisecondsSince1970
                let json = try decoder.decode(WeatherForeCastingForCurrentCityData.self, from: data)
                completion(.success(json))
                
            } catch let error {
                completion(.failure(error))
            }
            
        })
    }
}
