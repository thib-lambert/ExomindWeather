//
//  WeatherResponse.swift
//  TTWeather
//
//  Created by Thibaud Lambert on 03/06/2021.
//

import Foundation

struct WeatherResponse: Decodable, Weather {
	
	// MARK: - WeatherItem
	struct WeatherItem: Decodable {
		
		let description: String
		let icon: String
	}
	
	// MARK: - WeatherMainItem
	struct WeatherMainItem: Decodable {
		
		let temp: Double
	}
	
	let weather: [WeatherItem]
	let main: WeatherMainItem
	let name: String
	
	var temp: Double { self.main.temp }
	var cloudDescription: String? { self.weather.first?.description }
	var cloudIcon: String? { self.weather.first?.icon }
}
