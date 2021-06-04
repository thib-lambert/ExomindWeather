//
//  Interactor.swift
//  Tour de France
//
//  Created by Michael Coqueret on 18/02/2021.
//  Copyright © 2021 L'Équipe. All rights reserved.
//

import UIKit

class Interactor<V: UIViewController, P: Presenter<V>> {
    
    // MARK: - Variables
    var presenter: P
    
    // MARK: - Init
    init(with view: V) {
        self.presenter = P(with: view)
    }
}
