//
//  ApiRequest.swift
//  TTWeather
//
//  Created by Thibaud Lambert on 03/06/2021.
//

import Foundation
import PromiseKit
import NetworkUtilsKit
import UtilsKit

protocol ApiRequest: RequestProtocol { }

extension ApiRequest {
	
	var scheme: String { "https" }
	var host: String { "api.openweathermap.org" }
	
	/**
	Send request and return response or error
	*/
	func response<T: Decodable>(_ type: T.Type) -> Promise<T> {
		Promise { resolver in
			self.response(type) { results in
				switch results {
				case .success(let response): resolver.fulfill(response)
				case .failure(let error): resolver.reject(error)
				}
			}
		}.recover { error -> Promise<T> in
			log(.debug, error: error)
			return .init(error: error)
		}
	}
}
