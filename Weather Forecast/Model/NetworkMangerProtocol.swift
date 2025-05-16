//
//  NetworkMangerProtocol.swift
//  Weather Forecast
//
//  Created by Macos on 16/05/2025.
//

import Foundation

protocol NetworkMangerProtocol{
    typealias CurrentWeatherComplition = (Result<[WeatherDto],Error>) -> Void
    func getCurrentWeather(latitude:Double,longitude:Double,language:String,unit:String,completion: @escaping CurrentWeatherComplition)
}
