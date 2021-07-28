//
//  AppConfiguration.swift
//  EventFinder
//
//  Created by Anusha G 7/25/21.
//

import Foundation

class AppConfiguration {
    
    var networkManager: NetworkManager
    var eventRepository: EventRepository
    
    init() {
        networkManager = NetworkManager()
        eventRepository = EventRepository(networkManager: networkManager)
    }
}
