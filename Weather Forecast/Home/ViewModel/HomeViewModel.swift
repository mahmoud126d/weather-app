//
//  HomeViewModel.swift
//  Weather Forecast
//
//  Created by Macos on 16/05/2025.
//

import Foundation

class HomeViewModel{
    
    let networkManger:NetworkMangerProtocol
    
    var currentWeather : WeatherDto?
    
    var bindToViewController:(()->()) = {}
    
    init(networkManger: NetworkMangerProtocol) {
        self.networkManger = networkManger
        fetchUserSettings()
    }
    
    var latitude:Double?
    var longitude:Double?
    var language:String?
    var unit:String?
    
    private func fetchUserSettings(){
        language = UserDefaultManger.shared.language
        unit = UserDefaultManger.shared.unitSystem
    }

    func fetchCurrentWeather(){
        networkManger.getCurrentWeather(latitude: 0.0, longitude: 0.0, language: language ?? "en", unit: unit ?? "metric"){[weak self]
            result in
            switch result{
            case .success(let currentWeather):
                self?.currentWeather = currentWeather.first
                self?.bindToViewController()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
