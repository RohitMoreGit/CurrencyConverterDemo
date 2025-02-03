//
//  CurrencyConversionViewModel.swift
//  CurrencyConverter
//
//  Created by Rohit More on 01/02/25.
//

import Foundation

protocol CurrencyConversionDelegate: AnyObject {
    func didCompleteConversion(result: CurrencyConversionModel)
}

class CurrencyConversionViewModel {
    
    weak var delegate : CurrencyConversionDelegate?
    func convertCurrency(_ from: String,
                                _ to: String,
                                _ amount: Int) async  {
        
        let result = await CurrencyConversionAPIManager.convertCurrency(from, to, amount)
        if let result = result {
            self.delegate?.didCompleteConversion(result: result)
        } else {
            
        }
    }
}
