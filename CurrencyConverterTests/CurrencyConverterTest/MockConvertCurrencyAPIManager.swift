//
//  MockConvertCurrencyAPIManager.swift
//  CurrencyConverterTests
//
//  Created by Rohit More on 02/02/25.
//

import Foundation

@testable import CurrencyConverter

class MockConvertCurrencyAPIManager {
    
    var shouldReturnError = false
    var convertCurrencyCalled = false
    var convertCurrencyFlag = false
    var currencyConversionViewModel: CurrencyConversionViewModel?
    
    func reset() {
        shouldReturnError = false
        convertCurrencyCalled = false
    }
    
    init(_ shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }

    convenience init() {
        self.init(false)
    }
}

extension MockConvertCurrencyAPIManager {
    func convertCurrency(from: String,
                         to: String,
                         amount: Int,
                         completionHandler: @escaping (_ flag: Bool) -> Void) async{
    currencyConversionViewModel = CurrencyConversionViewModel()
        convertCurrencyFlag = true
        await currencyConversionViewModel?.convertCurrency(from, to, amount)
        completionHandler(convertCurrencyFlag)
    }
}
