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
    let base : String
    let main:Mains
    let visibility:Float
    let wind:Wind
    let clouds:Clouds
    let dt: Int
    let sys:Sys
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
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        coord = try container.decode(Coord.self, forKey: .coord)
        weather = try container.decode(Array.self, forKey: .weather)
        base = try container.decode(String.self, forKey: .base)
        main = try container.decode(Mains.self, forKey: .main)
        visibility = try container.decodeIfPresent(Float.self, forKey: .visibility) ?? 0
        wind = try container.decode(Wind.self, forKey: .wind)
        clouds = try container.decode(Clouds.self, forKey: .clouds)
        dt = try container.decode(Int.self, forKey: .dt)
        sys = try container.decode(Sys.self, forKey: .sys)
        timezone = try container.decode(Int.self, forKey: .timezone)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        cod = try container.decode(Int.self, forKey: .cod)
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

struct Mains:Codable {
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

struct Wind :Codable {
    let speed:Float
    let deg:Float
    
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
}

struct Clouds:Codable {
    let all:Int
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}

struct Sys:Codable {
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
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try (container.decodeIfPresent(Int.self, forKey: .type) ?? 0)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        country = try container.decode(String.self, forKey: .country)
        sunrise = try container.decode(Int.self, forKey: .sunrise)
        sunset = try container.decode(Int.self, forKey: .sunset)
        
    }
}
