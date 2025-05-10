//
//  ViewController.swift
//  Weather Forecast
//
//  Created by mahmoud on 08/05/2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var clouldLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func weaklyButton(_ sender: Any) {
    }
    
    @IBAction func hourlyButton(_ sender: Any) {
    }
    
    
    
    
    @IBAction func settingButton(_ sender: Any) {
        let settingVc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController")
        navigationController?.pushViewController(settingVc!, animated: true)
    }
    
    
}

