//
//  ApiParameterValidation.swift
//  CurrencyConverter
//
//  Created by Rohit More on 02/02/25.
//

import Foundation

struct CorrencyConversionValidation {
    var fromField: String
    var toField: String
    var amountField: Int
    
    func fromFieldValidation() -> String? {
        guard !fromField.isEmpty else {
            return .targetValidationMessage
        }
        
        return nil
    }
    
    func toFieldValidation() -> String? {
        guard !toField.isEmpty else {
            return .destinationValidationMessage
        }
        
        return nil
    }
    
    func amountFieldValidation() -> String? {
        guard amountField != 0 else {
            return .amountValidationMessage
        }
        
        return nil
    }
}

extension String {
    static let targetValidationMessage = "Please select target currency to convert."
    static let destinationValidationMessage = "Please select destination currency."
    static let amountValidationMessage = "Please enter valid amount to convert."
}
