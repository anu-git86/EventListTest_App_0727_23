//
//  Event.swift
//  EventFinder
//
//  Created by Anusha G 7/25/21.
//

import Foundation

struct Event: Codable & Hashable {
    
    let id: Int
    let title: String
    let date: Date?
    let city: String
    let state: String?
    let imageURL: String?
    
    var formattedCityState: String {
        var cityState = "\(city)"
        if let state = state {
            cityState += ", \(state)"
        }
        return cityState
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
