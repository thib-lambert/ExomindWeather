//
//  WeatherButton.swift
//  ExomindWeather
//
//  Created by Thibaud Lambert on 04/06/2021.
//

import UIKit

class WeatherButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .naplesYellow
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.setTitleColor(.davysGrey, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height / 4
    }
}
