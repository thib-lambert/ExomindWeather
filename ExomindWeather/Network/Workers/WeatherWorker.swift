//
//  WeatherWorker.swift
//  TTWeather
//
//  Created by Thibaud Lambert on 03/06/2021.
//

import Foundation
import PromiseKit
import NetworkUtilsKit

protocol WeatherWorkerDelegate: AnyObject {
	func didRefresh(city: String, data: Weather)
}

class WeatherWorker: Worker {
	
	weak var delegate: WeatherWorkerDelegate?
	
	func fetchData(forCity city: String) {
		_ = WeatherRequest(city: city)
			.response(WeatherResponse.self)
			.done { [delegate] data in
				delegate?.didRefresh(city: city, data: data)
			}
	}
	
	func fetchCities() -> [String] {
		[
			"Rennes",
			"Paris",
			"Nantes",
			"Bordeaux",
			"Lyon"
		]
	}
}
