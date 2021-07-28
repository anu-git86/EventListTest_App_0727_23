//
//  Presenter.swift
//  EventFinder
//
//  Created by Anusha G 7/25/21.
//

import Foundation

protocol Presenter {
    
    associatedtype View
    
    func attachView(view: View)
    func detachView()
}
