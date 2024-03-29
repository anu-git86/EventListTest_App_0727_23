//
//  DataResponse.swift
//  EventFinder
//
//  Created by Anusha G 7/25/21.
//

import Foundation

struct DataResponse<T> {
    
    let data: T?
    let urlResponse: URLResponse?
    
    init(data: T?, urlResponse: URLResponse?) {
        self.data = data
        self.urlResponse = urlResponse
    }
}
