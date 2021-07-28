//
//  ResponseHandler.swift
//  EventFinder
//
//  Created by Anusha G 7/25/21.
//

import Foundation

protocol ResponseHandlerProtocol {
    
    func validateResponse(response: URLResponse?, data: Data?) throws
}

class ResponseHandler: ResponseHandlerProtocol {
    
    let statusCodeRange: Range<Int>
    
    init(statusCodeRange: Range<Int> = 200..<300) {
        self.statusCodeRange = statusCodeRange
    }
    
    func validateResponse(response: URLResponse?, data: Data?) throws {
        let errorResponse = ErrorResponse(data: data, urlResponse: response)
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.emptyServerResponse
        }
        if !statusCodeRange.contains(response.statusCode) {
            throw NetworkError.invalidServerResponse(errorResponse: errorResponse)
        }
    }
}
