//
//  WeatherRequest.swift
//  TTWeather
//
//  Created by Thibaud Lambert on 03/06/2021.
//

import PromiseKit
import NetworkUtilsKit

struct WeatherRequest: ApiRequest {
	
	let city: String
	
	var path: String { "/data/2.5/weather" }
	let method: RequestMethod = .get
	let encoding: Encoding = .url
	
	var parameters: Parameters? {
		[
			"q": self.city,
			"appid": "438af97430c3705c5cd98dc30d6c277f"
		]
	}
}
