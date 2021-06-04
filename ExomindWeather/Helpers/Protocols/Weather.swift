//
//  Weather.swift
//  TTWeather
//
//  Created by Thibaud Lambert on 03/06/2021.
//

import Foundation

protocol Weather {
	
	var name: String { get }
	var temp: Double { get }
	var cloudDescription: String? { get }
	var cloudIcon: String? { get }
}
