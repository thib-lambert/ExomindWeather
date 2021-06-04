//
//  DetailsInteractor.swift
//  TTWeather
//
//  Created by Thibaud Lambert on 03/06/2021.
//

import Foundation

class DetailsInteractor: Interactor<DetailsViewController, DetailsPresenter> {
	
	// MARK: - Variables
	private lazy var weatherWorker: WeatherWorker = {
		let worker = WeatherWorker()
		worker.delegate = self
		return worker
	}()
	
	func resfresh(forCity city: String) {
		self.weatherWorker.fetchData(forCity: city)
	}
	
	func getCities() {
		self.presenter.didfetchCities(cities: self.weatherWorker.fetchCities())
	}
}

// MARK: - WeatherWorkerDelegate
extension DetailsInteractor: WeatherWorkerDelegate {
	
	func didRefresh(city: String, data: Weather) {
		self.presenter.didRefresh(city: city, data: data)
	}
}
