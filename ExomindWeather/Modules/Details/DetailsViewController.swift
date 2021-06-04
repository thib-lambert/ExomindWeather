//
//  DetailsViewController.swift
//  TTWeather
//
//  Created by Thibaud Lambert on 03/06/2021.
//

import UIKit

class DetailsViewController: UIViewController {
	
	// MARK: - Outlets
	@IBOutlet private weak var refreshButton: UIButton!
	@IBOutlet private var progressBar: UIProgressView! {
		didSet {
			self.progressBar.setProgress(0, animated: false)
		}
	}
	
	// MARK: - Variables
	var timer: Timer?
	private lazy var interactor: DetailsInteractor = {
		DetailsInteractor(with: self)
	}()
	
	private var availablesCities: [String] = []
	
	private var data: [String: WeatherViewModel] = [:] {
		didSet {
			if self.data.allSatisfy({ key, _ in
				availablesCities.contains(key)
			}) {
				// TODO: - Reload data
				
				self.refreshButton.isHidden = false
				self.progressBar.isHidden = true
			}
		}
	}
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
        self.interactor.getCities()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.refreshButton.layer.cornerRadius = self.refreshButton.bounds.height / 4
	}
	
	// MARK: - Refresh
	func didRefresh(forCity city: String, data: WeatherViewModel) {
		self.data[city] = data
	}
	
	func didFetchCities(cities: [String]) {
		self.availablesCities = cities
        
        self.availablesCities.forEach {
            self.interactor.resfresh(forCity: $0)
        }
	}
}
