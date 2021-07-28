//
//  EventDetailCoordinator.swift
//  EventFinder
//
//  Created by Anusha G 7/25/21.
//

import UIKit

class EventDetailCoordinator: Coordinator {
    
    private let appConfiguration: AppConfiguration
    private let navigationController: UINavigationController
    private let event: Event
    
    init(navigationController: UINavigationController, appConfiguration: AppConfiguration, event: Event) {
        self.navigationController = navigationController
        self.appConfiguration = appConfiguration
        self.event = event
    }
    
    func start() {
        let eventDetailViewController = EventDetailViewController(appConfiguration: appConfiguration, event: event)
        navigationController.pushViewController(eventDetailViewController, animated: true)
    }
}
