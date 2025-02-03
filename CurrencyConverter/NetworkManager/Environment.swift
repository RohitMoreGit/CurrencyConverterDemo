//
//  Environment.swift
//  CurrencyConverter
//
//  Created by Rohit More on 02/02/25.
//

import Foundation

extension String {
    static let baseUrl = "https://api.currencylayer.com"
    static let endPoint = "/convert?"
    static let accessKey = "c1d4a7a135456b3412370990ead27fbb"
}

public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

public enum RequestEndPoint: String {
    case convert = "/convert?"
}
