//
//  NetworkManger.swift
//  Weather Forecast
//
//  Created by Macos on 16/05/2025.
//

import Foundation
import Alamofire

class NetworkManger : NetworkMangerProtocol{
    
    static let shared:NetworkManger = NetworkManger()
    
    private init(){}
    
    func getCurrentWeather(latitude: Double, longitude: Double, language: String, unit: String,completion: @escaping (Result<[WeatherDto], Error>) -> Void) {
        AF.request("https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&lang=\(language)&unit=\(unit)&appid=ec249047fd82a3c25ab8e14f071f6194")
            .validate()
            .responseDecodable(of: WeatherResponse.self) { response in
                switch response.result {
                case .success(let data):
                    guard let result = data.list else {
                        return
                    }
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                }
                
            }
    }
    
    
}
