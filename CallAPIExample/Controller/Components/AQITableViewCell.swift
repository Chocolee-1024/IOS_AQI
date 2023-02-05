//
//  AQITableViewCell.swift
//  CallAPIExample
//
//  Created by imac-1763 on 2023/2/3.
//

import UIKit

class AQITableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var countyLabel: UILabel!
    @IBOutlet weak var aqiLabel: UILabel!
    static let identifier = "AQITableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupInit(country: String, status: String, aqi: Int){
        countyLabel.text = country
        statusLabel.text = status
        aqiLabel.text = "\(aqi)"
        aqiLabel.textAlignment = .center
        setupAQILabel(aqi: aqi)
    }
    private func setupAQILabel(aqi: Int){
        
        switch aqi {
        case 0 ... 50:
            aqiLabel.backgroundColor = .systemGreen
        case 51 ... 100:
            aqiLabel.backgroundColor = .systemYellow
        case 101 ... 150:
            aqiLabel.backgroundColor = .systemOrange
        case 151 ... 200:
            aqiLabel.backgroundColor = .systemRed
        case 201 ... 300:
            aqiLabel.backgroundColor = .systemPurple
        case _ where aqi > 300:
            aqiLabel.backgroundColor = UIColor(red: CGFloat(188/255), green: CGFloat(143/255), blue: CGFloat(143/255), alpha: 1)
        default:
            break
        }
    }
    
}
