//
//  URLSessionMock.swift
//  EventFinderTests
//
//  Created by Anusha G 7/25/21.
//

import Foundation
@testable import EventFinder

class URLSessionMock: URLSession {
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let dataTaskMock = DataTaskMock()
        dataTaskMock.completionHandler = completionHandler
        return dataTaskMock
    }
}
