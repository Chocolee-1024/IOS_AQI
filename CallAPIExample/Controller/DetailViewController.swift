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
    var aqiArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI(){
        setupLabel()
        setupView()
        setupAQI(aqiValue: aqiArray[2].toInt())
    }
    private func setupLabel(){


        conutry.text = "縣市："
        status.text = "狀態："
        healthy.text = "對健康的影響"
        measure.text = "建議採取的措施"
        countryLabel.text = aqiArray[0]
        statusLabel.text = aqiArray[1]
        
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
    private func setupAQI(aqiValue: Int){
        aqi.text = "AQI數值："
        aqi.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        aqiLabel.text = aqiArray[2]
        aqiLabel.font = .systemFont(ofSize: 20)
        aqiLabel.sizeToFit()


        switch aqiValue {
        case 0 ... 50:
            aqiLabel.backgroundColor = .systemGreen
            measureLabel.text = "各類人群可正常活動"
            healthyLabel.text = "空氣品質令人滿意，基本無空氣污染"
        case 51 ... 100:
            aqiLabel.backgroundColor = .systemYellow
            measureLabel.text = "極少數異常敏感人群應減少戶外活動"
            healthyLabel.text = "空氣品質可接受，但某些污染物可能對極少數異常敏感人群健康有較弱影響"
        case 101 ... 150:
            aqiLabel.backgroundColor = .systemOrange
            measureLabel.text = "兒童、老年人及心臟病、呼吸系統疾病患者應減少長時間、高強度的戶外鍛鍊"
            healthyLabel.text = "易感人群症狀有輕度加劇，健康人群出現刺激症狀"
        case 151 ... 200:
            aqiLabel.backgroundColor = .systemRed
            measureLabel.text = "兒童、老年人及心臟病、呼吸系統疾病患者應避免長時間、高強度的戶外鍛鍊，一般人群適量減少戶外運動"
            healthyLabel.text = "進一步加劇易感人群症狀，可能對健康人群心臟、呼吸系統有影響"
        case 201 ... 300:
            aqiLabel.backgroundColor = .systemPurple
            measureLabel.text = "兒童、老年人及心臟病、呼吸系統疾病患者應停留在室內，停止戶外活動，一般人群應避免戶外活動"
            healthyLabel.text = "心臟病和肺病患者症狀顯著加劇，運動耐受力降低，健康人群普遍出現症狀"
        case _ where aqiValue > 300:
            aqiLabel.backgroundColor = UIColor(red: CGFloat(188/255), green: CGFloat(143/255), blue: CGFloat(143/255), alpha: 1)
            measureLabel.text = "兒童、老年人及心臟病、呼吸系統疾病患者應停留在室內，避免體力消耗，一般人群應避免戶外活動"
            healthyLabel.text = "健康人群運動耐受力降低，有明顯強烈症狀，提前出現某些疾病"
        default:
            break
        }
    }
    private func setupView(){
        informationView.layer.borderWidth = 2
        informationView.layer.cornerRadius = 15
        
        

    }
}
