//
//  WeatherData.swift
//  WeatherForecasting
//
//  Created by prathibha sundresh on 09/07/20.
//  Copyright © 2020 prathibha sundresh. All rights reserved.
//

import Foundation

struct WeatherData :Codable {
    let coord : Coord
    let weather : [weather]
    let base :String
    let main:mains
    let visibility:Float
    let wind:wind
    let clouds:clouds
    let dt: Int
    let sys:sys
    let timezone:Int
    let id:Int
    let name:String
    let cod:Int
    
    enum CodingKeys: String, CodingKey {
        case coord = "coord"
        case weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case clouds = "clouds"
        case dt = "dt"
        case sys = "sys"
        case timezone = "timezone"
        case id = "id"
        case name = "name"
        case cod = "cod"
    }
}

struct Coord :Codable {
    let lat:Float
    let lon:Float
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
}

struct weather :Codable {
    let id:Int
    let main:String
    let description:String
    let icon:String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}

struct mains:Codable {
    let temp:Float
    let feelsLike:Float
    let tempmin:Float
    let tempmax:Float
    let pressure:Float
    let humidity:Float
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case tempmin = "temp_min"
        case tempmax = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
}

struct wind :Codable {
    let speed:Float
    let deg:Float
    
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
}

struct clouds:Codable {
    let all:Int
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}

struct sys:Codable {
    let type:Int
    let id:Int
    let country:String
    let sunrise:Int
    let sunset:Int
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}
