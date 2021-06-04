//
//  HomeViewController.swift
//  TTWeather
//
//  Created by Thibaud Lambert on 03/06/2021.
//

import UIKit

class HomeViewController: UIViewController {
	
	// MARK: - Outlets
	@IBOutlet private weak var startButton: UIButton!
	
	// MARK: - View life cycle
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.startButton.layer.cornerRadius = self.startButton.bounds.height / 4
	}


	// MARK: - Actions
	@IBAction private func startApp() {
		let storyboard = UIStoryboard(name: "Details", bundle: .main)
		let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController")
		self.present(vc, animated: true)
	}
}

