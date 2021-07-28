//
//  EventSearchPresenter.swift
//  EventFinder
//
//  Created by Anusha G 7/25/21.
//

import Foundation

protocol EventSearchView: class {
    
    func setState(state: EventSearchViewController.State)
    func setEvents(events: [Event])
    func presentAlert(title: String?, message: String?)
}

class EventSearchPresenter: Presenter {
    
    private let appConfiguration: AppConfiguration
    private weak var view: EventSearchView!
    private var queryTimer: Timer?
    private var previousQuery: String?
    
    init(appConfiguration: AppConfiguration) {
        self.appConfiguration = appConfiguration
    }
    
    func attachView(view: EventSearchView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func queryEvents(query: String?) {
        guard query != previousQuery else {
            return
        }
        previousQuery = query
        view.setState(state: .loading)
        
        queryTimer?.invalidate()
        queryTimer = Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) { [weak self] _ in
            self?.appConfiguration.eventRepository.queryEvents(query: query!) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let events):
                        self?.view.setState(state: events.isEmpty ? EventSearchViewController.State.empty: .events)
                        self?.view.setEvents(events: events)
                    case .failure(let error):
                        self?.view.setState(state: .empty)
                        self?.view.presentAlert(title: NSLocalizedString("Event Error", comment: ""), message: error.localizedDescription)
                    }
                }
            }
        }
    }
}
