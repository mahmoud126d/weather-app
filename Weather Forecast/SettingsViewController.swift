//
//  SettingsViewController.swift
//  Weather Forecast
//
//  Created by mahmoud on 10/05/2025.
//

import UIKit

class SettingsViewController: UITableViewController {
    @IBOutlet weak var languageSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var unitSystemsSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var locationSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaultManger.shared.language ?? "defaut")
        print(UserDefaultManger.shared.unitSystem ?? "defaut")
        print(UserDefaultManger.shared.location ?? "defaut")
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        updateLanguageSegmentControlState()
        updateLocationSegmentControlState()
        updateUnitSystemsSegmentControlState()
    }
    
    @IBAction func languageSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
            UserDefaultManger.shared.language = "en"
            case 1:
            UserDefaultManger.shared.language = "ar"
            default:
                break
            }
    }
    @IBAction func unitSystemsSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
            UserDefaultManger.shared.unitSystem = "metric"
            case 1:
            UserDefaultManger.shared.unitSystem = "standard"
            case 2:
            UserDefaultManger.shared.unitSystem = "imperial"
            default:
                break
            }
    }
    
    @IBAction func locationSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
            UserDefaultManger.shared.location = "map"
            case 1:
            UserDefaultManger.shared.location = "gps"
            default:
                break
            }
    }
    
    private func updateLanguageSegmentControlState(){
        let language = UserDefaultManger.shared.language
        if language == "en"{
            languageSegmentControl.selectedSegmentIndex = 0
        }else{
            languageSegmentControl.selectedSegmentIndex = 1
        }
    }
    private func updateUnitSystemsSegmentControlState(){
        let unitSystem = UserDefaultManger.shared.unitSystem
        switch unitSystem {
        case "metric":
            unitSystemsSegmentControl.selectedSegmentIndex = 0
        case "standard":
            unitSystemsSegmentControl.selectedSegmentIndex = 1
        case "imperial":
            unitSystemsSegmentControl.selectedSegmentIndex = 2
        default:
            return
        }
    }
    private func updateLocationSegmentControlState(){
        let language = UserDefaultManger.shared.location
        if language == "map"{
            locationSegmentControl.selectedSegmentIndex = 0
        }else{
            locationSegmentControl.selectedSegmentIndex = 1
        }
    }
}
