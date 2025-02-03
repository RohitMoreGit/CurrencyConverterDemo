//
//  NetworkManager.swift
//  CurrencyConverter
//
//  Created by Rohit More on 02/02/25.
//

import Foundation
import UIKit

class NetworkRouter {
    typealias parameter = [String : String]
    static func request(_ parameter: parameter) async throws -> (Data, HTTPURLResponse) {

         guard let finalURL = self.createURL(baseURL: .baseUrl + .endPoint , parameters: parameter) else {
            throw NetworkResponseError.serviceUnavailable
        }
        
        let (data, response) = try await URLSession.shared.data(from: finalURL)
        
         guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
             
             throw NetworkResponseError.failed
         }
        
         return (data, response)
        
    }
    
    static private func createURL(baseURL: String, parameters: parameter) -> URL? {
        guard var components = URLComponents(string: baseURL) else {
            print("Invalid base URL")
            return nil
        }
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        return components.url
    }
}

//https://api.currencylayer.com/convert?access_key=c1d4a7a135456b3412370990ead27fbb&format=1&from=USD&to=INR&amount=100

// ["access_key":"c1d4a7a135456b3412370990ead27fbb","from":"USD", "to":"INR", "amount":"1000"]
