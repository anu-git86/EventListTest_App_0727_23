//
//  AuthenticatorProtocol.swift
//  EventFinder
//
//  Created by Anusha G 7/25/21.

import Foundation

typealias AuthenticationCompletion = (Result<URLRequest, Error>) -> Void

protocol AuthenticatorProtocol {
    
    func addAuthentication(requestConfiguration: RequestConfiguration, urlRequest: URLRequest, completion: @escaping AuthenticationCompletion)
}
