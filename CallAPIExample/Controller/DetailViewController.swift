//
//  DetailViewController.swift
//  CallAPIExample
//
//  Created by imac-1763 on 2023/2/3.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var conutry: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var aqi: UILabel!
    @IBOutlet weak var aqiLabel: UILabel!
    @IBOutlet weak var healthy: UILabel!
    @IBOutlet weak var healthyLabel: UILabel!
    @IBOutlet weak var measure: UILabel!
    @IBOutlet weak var measureLabel: UILabel!
    @IBOutlet weak var informationView: UIStackView!
    @IBOutlet var aqiView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI(){
        setupLabel()
        setupView()
        setupAQI()
    }
    private func setupLabel(){

        
        conutry.text = "縣市："
        status.text = "狀態："
        healthy.text = "對健康的影響"
        measure.text = "建議採取的措施"
        countryLabel.text = UserPreferences.shared.lastSelectCounty
        statusLabel.text = UserPreferences.shared.lasetSelcetStatus
        
        countryLabel.font = .systemFont(ofSize: 20)
        statusLabel.font = .systemFont(ofSize: 20)

        countryLabel.sizeToFit()
        measureLabel.sizeToFit()
        
        healthy.textAlignment = .center
        measure.textAlignment = .center
        measureLabel.textAlignment = .center
        healthyLabel.textAlignment = .center
        

        conutry.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        status.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        healthy.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        measure.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        healthy.layer.borderWidth = 2
        measure.layer.borderWidth = 2
        healthy.layer.cornerRadius = 15
        measure.layer.cornerRadius = 15
        
        healthy.backgroundColor = .init(red: 156/255, green: 151/255, blue: 176/255, alpha: 1)
        measure.backgroundColor = .init(red: 156/255, green: 151/255, blue: 176/255, alpha: 1)
       
    }
    private func setupAQI(){
        aqi.text = "AQI數值："
        aqi.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        aqiLabel.text = UserPreferences.shared.lasetSelectAQI
        aqiLabel.font = .systemFont(ofSize: 20)
        aqiLabel.sizeToFit()
        
        let aqiValue: Int = UserPreferences.shared.lasetSelectAQI.toInt()

        switch aqiValue {
        case 0 ... 50:
            aqiLabel.backgroundColor = .systemGreen
            measureLabel.text = DetailConstnts.healthy.leval_One.rawValue
            healthyLabel.text = DetailConstnts.measure.leval_One.rawValue
        case 51 ... 100:
            aqiLabel.backgroundColor = .systemYellow
            measureLabel.text = DetailConstnts.healthy.leval_Two.rawValue
            healthyLabel.text = DetailConstnts.measure.leval_Two.rawValue
        case 101 ... 150:
            aqiLabel.backgroundColor = .systemOrange
            measureLabel.text = DetailConstnts.healthy.leval_Three.rawValue
            healthyLabel.text = DetailConstnts.measure.leval_Three.rawValue
        case 151 ... 200:
            aqiLabel.backgroundColor = .systemRed
            measureLabel.text = DetailConstnts.healthy.leval_Four.rawValue
            healthyLabel.text = DetailConstnts.measure.leval_Four.rawValue
        case 201 ... 300:
            aqiLabel.backgroundColor = .systemPurple
            measureLabel.text = DetailConstnts.healthy.leval_Five.rawValue
            healthyLabel.text = DetailConstnts.measure.leval_Five.rawValue
        case _ where aqiValue > 300:
            aqiLabel.backgroundColor = UIColor(red: CGFloat(188/255), green: CGFloat(143/255), blue: CGFloat(143/255), alpha: 1)
            measureLabel.text = DetailConstnts.healthy.leval_Six.rawValue
            healthyLabel.text = DetailConstnts.measure.leval_Six.rawValue
        default:
            break
        }
    }
    private func setupView(){
        informationView.layer.borderWidth = 2
        informationView.layer.cornerRadius = 15
    }
}
