//
//  CurrencyConversionAPIManager.swift
//  CurrencyConverter
//
//  Created by Rohit More on 02/02/25.
//

import Foundation

class CurrencyConversionAPIManager {
    
    static func convertCurrency(_ from: String, _ to: String, _ amount: Int) async -> CurrencyConversionModel? {
        
        do {
            let (data, response) = try await NetworkRouter.request(["access_key":.accessKey,
                                                                    "from":from,
                                                                    "to":to,
                                                                    "amount":String(amount)])
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                return try JSONDecoder().decode(CurrencyConversionModel.self, from: data)
            } else {
                
            }

        } catch (let error) {
            debugPrint(error)
        }
        
        return nil
    }
}
