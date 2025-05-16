//
//  WeatherModel.swift
//  Weather Forecast
//
//  Created by Macos on 16/05/2025.
//

import Foundation

struct WeatherDto : Decodable{
    let main:Main?
    let weather:[Weather]?
    let clouds:Clouds?
    let wind:Wind?
    let date:String?
    enum CodingKeys: String, CodingKey {
        case main
        case weather
        case clouds
        case wind
        case date = "dt_txt"
    }
}


struct WeatherResponse : Decodable{
    let list:[WeatherDto]?
}

struct Main : Decodable{
    let temp : Double?
    let pressure : Int?
    let humidity : Int?
}
struct Weather : Decodable{
    let id : Int?
    let description : String?
    let icon : String?
}
struct Wind : Decodable{
    let speed:Double?
}

struct Clouds : Decodable{
    let all:Int?
}
