//
//  DateFormatter+Extension.swift
//  EventFinder
//
//  Created by Anusha G 7/25/21.
//

import Foundation

extension DateFormatter {
    
    static let eventOriginationFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
    
    static let eventFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy hh:mm a"
        return formatter
    }()
}
