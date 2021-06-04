//
//  WeatherDetailsCell.swift
//  ExomindWeather
//
//  Created by Thibaud Lambert on 04/06/2021.
//

import UtilsKit

class WeatherDetailsCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var cloudImage: UIImageView!
    @IBOutlet private weak var stackView: UIStackView! {
        didSet {
            self.stackView.layer.cornerRadius = 10
            self.stackView.layer.borderWidth = 1
            self.stackView.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    // MARK: - Variables
    var data: WeatherViewModel? {
        didSet {
            guard let data = self.data else { return }
            
            self.cityLabel.text = data.city
            self.tempLabel.text = "\(data.temp) °C"
            self.cloudImage.setImage(with: data.cloudIcon)
        }
    }
}

// MARK: - WeatherDetailsCell
extension WeatherDetailsCell: ViewReusable {
    static let identifier: String = "WeatherDetailsCell"
}
