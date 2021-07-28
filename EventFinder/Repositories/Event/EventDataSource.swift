//
//  EventDataSource.swift
//  EventFinder
//
//  Created by Anusha G 7/25/21.
//

import Foundation

typealias EventDataSourceCompletion = (Result<[Event], Error>) -> Void

protocol EventDataSource {
    
    func queryEvents(query: String, completion: EventDataSourceCompletion?)
    
    func addFavoriteEvent(event: Event)
    func removeFavoriteEvent(event: Event)
    func eventIsFavorite(event: Event) -> Bool
}
