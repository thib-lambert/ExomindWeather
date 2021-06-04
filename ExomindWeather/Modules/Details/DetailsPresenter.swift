//
//  DetailsPresenter.swift
//  TTWeather
//
//  Created by Thibaud Lambert on 03/06/2021.
//

import Foundation

class DetailsPresenter: Presenter<DetailsViewController> {
	
	func didRefresh(city: String, data: Weather) {
		self.view?.didRefresh(forCity: city, data: WeatherViewModel(temp: data.temp,
																	city: city,
																	cloud: data.cloudDescription ?? ""))
	}
	
	func didfetchCities(cities: [String]) {
		self.view?.didFetchCities(cities: cities)
	}
}
