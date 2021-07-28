//
//  EventNetworkDataSourceMock.swift
//  EventFinderTests
//
//  Created by Anusha G 7/25/21.
//

import Foundation
@testable import EventFinder

class EventNetworkDataSourceMock: EventDataSource {
    
    var dataSourceCompletionResult: Result<[Event], Error>?
    
    func queryEvents(query: String, completion: EventDataSourceCompletion?) {
        if let dataSourceCompletionResult = dataSourceCompletionResult {
            completion?(dataSourceCompletionResult)
        }
    }
    
    func addFavoriteEvent(event: Event) { }
    func removeFavoriteEvent(event: Event) { }
    func eventIsFavorite(event: Event) -> Bool { return false }
}
