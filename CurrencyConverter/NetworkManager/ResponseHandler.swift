//
//  ResponseHandler.swift
//  CurrencyConverter
//
//  Created by Rohit More on 02/02/25.
//

import Foundation

final class Response {
    class func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Any?, Error> {
        switch response.statusCode {
        case 200...299: return .success(nil)
        case 400:return .failure(NetworkResponseError.badRequest)
        case 401: return .failure(NetworkResponseError.authenticationError)
        case 403:return .failure(NetworkResponseError.forbidden)
        case 404:return .failure(NetworkResponseError.notFound)
        case 429:return .failure(NetworkResponseError.tooManyRequests)
        case 500:return .failure(NetworkResponseError.internalServerError)
        case 503:return .failure(NetworkResponseError.serviceUnavailable)
        case 600: return .failure(NetworkResponseError.outdated)
        default: return .failure(NetworkResponseError.failed)
        }
    }
}
