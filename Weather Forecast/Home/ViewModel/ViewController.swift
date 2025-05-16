//
//  ViewController.swift
//  Weather Forecast
//
//  Created by mahmoud on 08/05/2025.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var clouldLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    var homeViewModel:HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeViewModel = HomeViewModel(networkManger: NetworkManger.shared)
        homeViewModel?.fetchCurrentWeather()
        homeViewModel?.bindToViewController = {
            [weak self] in
            self?.updateCurrentWeatherUi()
        }
    }
    
    @IBAction func weaklyButton(_ sender: Any) {
    }
    
    @IBAction func hourlyButton(_ sender: Any) {
    }
    
    
    
    
    @IBAction func settingButton(_ sender: Any) {
        let settingVc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController")
        navigationController?.pushViewController(settingVc!, animated: true)
    }
    
    private func updateCurrentWeatherUi(){
        guard let temp =  homeViewModel?.currentWeather?.main?.temp else{
            return
        }
        guard let weatherDescription =  homeViewModel?.currentWeather?.weather?.first?.description else{
            return
        }
        guard let windSpeed =  homeViewModel?.currentWeather?.wind?.speed else{
            return
        }
        guard let clouds =  homeViewModel?.currentWeather?.clouds?.all else{
            return
        }
        guard let humidity =  homeViewModel?.currentWeather?.main?.humidity else{
            return
        }
        guard let pressure =  homeViewModel?.currentWeather?.main?.pressure else{
            return
        }
        guard let weatherIcon = homeViewModel?.currentWeather?.weather?.first?.icon else{
            return
        }
        temperatureLabel.text = String(describing: temp)
        weatherDescriptionLabel.text = weatherDescription
        windSpeedLabel.text = String(describing: windSpeed)
        clouldLabel.text = String(describing: clouds)
        humidityLabel.text = String(describing: humidity)
        pressureLabel.text = String(describing: pressure)
        
        self.weatherIcon.sd_setImage(with: URL(string: "https://openweathermap.org/img/wn/\(weatherIcon)@2x.png"), placeholderImage: UIImage(named: "placeholder.png"))
        
    }
}

