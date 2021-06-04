//
//  WeatherButton.swift
//  ExomindWeather
//
//  Created by Thibaud Lambert on 04/06/2021.
//

import UIKit

@IBDesignable
class WeatherButton: UIButton {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        self.backgroundColor = .backgroundSecondary
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.setTitleColor(.textColor, for: .normal)
    }
    
    // MARK: - View life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height / 4
    }
    
    // MARK: - Interface Builder
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupButton()
    }
}
