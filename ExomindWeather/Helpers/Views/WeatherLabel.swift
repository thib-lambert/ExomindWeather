//
//  WeatherLabel.swift
//  ExomindWeather
//
//  Created by Thibaud Lambert on 04/06/2021.
//

import UIKit

@IBDesignable
class WeatherLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }
    
    private func setupLabel() {
        self.textColor = .textColor
        self.font = UIFont.systemFont(ofSize: 24)
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupLabel()
    }
}
