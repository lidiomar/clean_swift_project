//
//  DriverStandingsPresenter.swift
//  f1Project
//
//  Created by Lidiomar Fernando Machado on 21/02/19.
//  Copyright © 2019 Lidiomar Fernando Machado. All rights reserved.
//

import UIKit

protocol DriverStandingsPresentationLogic {
    func presentFetchedDriverStanding(response: DriverStandings.FetchDriverStandings.Response)
    
}

class DriverStandingsPresenter: DriverStandingsPresentationLogic {
    
    weak var viewController: DriverStandingsDisplayLogic?
    
    func presentFetchedDriverStanding(response: DriverStandings.FetchDriverStandings.Response) {
        let driverStandings = response.driverStandings
        var driverPresentations: [DriverPresentation] = [DriverPresentation]()
        
        for driverStanding in driverStandings {
            
            var driverPresentation: DriverPresentation = DriverPresentation()
            
            driverPresentation.positionText =  driverStanding.positionText
            driverPresentation.givenName = driverStanding.Driver?.givenName
            driverPresentation.familyName = driverStanding.Driver?.familyName
            
            driverPresentations.append(driverPresentation)
        }
        
        let viewModel = DriverStandings.FetchDriverStandings.ViewModel(displayedDriverStanding: driverPresentations)
        viewController?.displayDriverStandings(viewModel: viewModel)
        
    }
    
    
    
}
