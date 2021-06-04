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
    var cloudIcon: URL? {
        guard let icon = self.weather.first?.icon else { return nil }
        return URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
    }
}
