//
//  NetworkResponseError.swift
//  CurrencyConverter
//
//  Created by Rohit More on 01/02/25.
//

import Foundation

enum CustomeNetworkError: Error {
    case custom(message: String)
    var errorMessage: String {
        switch self {
        case .custom(let message):
            return message
        }
    }
}

enum NetworkResponseError: Error {
    case authenticationError
    case badRequest
    case outdated
    case failed
    case noData
    case unableToDecode
    case forbidden
    case notFound
    case tooManyRequests
    case internalServerError
    case serviceUnavailable
    var errorMessage: String {
        switch self {
        case .authenticationError:
            return "You need to be authenticated first."
        case .badRequest:
            return "Bad request"
        case .outdated:
            return "The url you requested is outdated."
        case .failed:
            return "No Internet connection."
        case .noData:
            return "Response returned with no data to decode."
        case .unableToDecode:
            return "We could not decode the response."
        case .forbidden:
            return "Request is forbidden"
        case .notFound:
            return "Result not found"
        case .tooManyRequests:
            return "Number of requests exceeded"
        case .internalServerError:
            return "Internal Sever Error occurred"
        case .serviceUnavailable:
            return "This service is unavailable"
        }
    }
}
