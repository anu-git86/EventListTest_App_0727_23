//
//  EventRepository.swift
//  EventFinder
//
//  Created by Anusha G 7/25/21.
//

import Foundation

typealias EventRepositoryCompletion = (Result<[Event], Error>) -> Void

class EventRepository {
    
    var networkDataSource: EventDataSource
    var localDataSource: EventDataSource
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        
        networkDataSource = EventNetworkDataSource(networkManager: networkManager)
        localDataSource = EventLocalDataSource()
    }
    
    func queryEvents(query: String, completion: EventRepositoryCompletion?) {
        networkDataSource.queryEvents(query: query) { result in
            switch result {
            case .success(let items):
                completion?(.success(items))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    func addFavorite(event: Event) {
        localDataSource.addFavoriteEvent(event: event)
    }
    
    func removeFavorite(event: Event) {
        localDataSource.removeFavoriteEvent(event: event)
    }
    
    func eventIsFavorite(event: Event) -> Bool {
        return localDataSource.eventIsFavorite(event: event)
    }
}
