//
//  WeatherForeCastingForCurrentCityData.swift
//  WeatherForecasting
//
//  Created by prathibha sundresh on 10/07/20.
//  Copyright © 2020 prathibha sundresh. All rights reserved.
//

import Foundation

struct WeatherForeCastingForCurrentCityData :Codable {
    let cod : String
    let message : Int
    let cnt :Int
    let list:[List]
    let city:CityForeCase
    
    enum CodingKeys: String, CodingKey {
        case cod = "cod"
        case message = "message"
        case cnt = "cnt"
        case list = "list"
        case city = "city"
    }
}

struct List :Codable {
    let dt:Int
    let main:MainsNew
    let weather:[weather]
    let clouds: Clouds
    let wind:Wind
    let sys:sysFore
    let dttxt:String
   
    
    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case main = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case sys = "sys"
        case dttxt = "dt_txt"
    }
}

struct Rain:Codable {
    let threeh:Int
    enum CodingKeys: String, CodingKey {
        case threeh = "3h"
    }
}

struct sysFore:Codable {
    let pod:String
    enum CodingKeys: String, CodingKey{
        case pod = "pod"
    }
}


struct MainsNew : Codable {
    let temp:Float
    let feelsLike:Float
    let tempmin:Float
    let tempmax:Float
    let pressure:Float
    let humidity:Float
    let seaLevel:Int
    let grndLevel:Int
    let tempKf:Float
      
       enum CodingKeys: String, CodingKey {
            case temp = "temp"
            case feelsLike = "feels_like"
            case tempmin = "temp_min"
            case tempmax = "temp_max"
            case pressure = "pressure"
            case humidity = "humidity"
           case seaLevel = "sea_level"
           case grndLevel = "grnd_level"
           case tempKf = "temp_kf"
       }
}

struct CityForeCase :Codable {
    let id:Int
    let name:String
    let coord:Coord
    let country: String
    let population:Int
    let timezone:Int
    let sunrise:Float
    let sunset:Float
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case coord = "coord"
        case country = "country"
        case population = "population"
        case timezone = "timezone"
        case sunrise = "sunrise"
        case sunset = "sunset"
      
    }
}
