//
//  CurrencyConversionModel.swift
//  CurrencyConverter
//
//  Created by Rohit More on 01/02/25.
//

import Foundation

struct CurrencyConversionModel: Decodable {
    let success: Bool
    let terms, privacy: String
    let query: Query
    let info: Info
    let result: Double
}

// MARK: - Info
struct Info: Decodable {
    let timestamp: Int
    let quote: Double
}

// MARK: - Query
struct Query: Decodable {
    let from, to: String
    let amount: Int
}
