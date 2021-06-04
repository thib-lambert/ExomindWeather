//
//  UIImageView+URL.swift
//  ExomindWeather
//
//  Created by Thibaud Lambert on 04/06/2021.
//

import SDWebImage

extension UIImageView {
    
    func setImage(with url: URL?, completion: ((UIImage?) -> Void)? = nil) {
        self.sd_setImage(with: url) { image, _, _, _ in
            completion?(image)
        }
    }
}
