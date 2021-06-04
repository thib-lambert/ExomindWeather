//
//  Presenter.swift
//  Tour de France
//
//  Created by Michael Coqueret on 18/02/2021.
//  Copyright © 2021 L'Équipe. All rights reserved.
//

import UIKit

class Presenter<V: UIViewController> {
    
    // MARK: - Variables
    weak var view: V?
    
    // MARK: - Init
    required init(with view: V) {
        self.view = view
    }
}
