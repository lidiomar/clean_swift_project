//
//  DriverStandingsInteractor.swift
//  f1Project
//
//  Created by Lidiomar Fernando Machado on 21/02/19.
//  Copyright © 2019 Lidiomar Fernando Machado. All rights reserved.
//

import UIKit

protocol DriverStandingsBusinessLogic: class {
    func fetchDriverStandings(request: DriverStandings.FetchDriverStandings.Request)
}

class DriverStandingsInteractor: DriverStandingsBusinessLogic {
    var presenter: DriverStandingsPresentationLogic?
    var worker: DriverStandingsWorkerProtocol
    var driverStandings: [DriverStanding]?
    
    init() {
        worker = DriverStandingsWorker()
    }
    
    func fetchDriverStandings(request: DriverStandings.FetchDriverStandings.Request) {
        worker.fetchDriverStandings(request: request, completionHandler: {
            (response) -> Void in
            let response = DriverStandings.FetchDriverStandings.Response(driverStandings: response.driverStandings)
            self.presenter?.presentFetchedDriverStanding(response: response)
        })
    }
}
