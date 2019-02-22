//
//  DriverStandingsViewController.swift
//  f1Project
//
//  Created by Lidiomar Fernando Machado on 21/02/19.
//  Copyright © 2019 Lidiomar Fernando Machado. All rights reserved.
//

import UIKit

protocol DriverStandingsDisplayLogic: class {
    func displayDriverStandings(viewModel: DriverStandings.FetchDriverStandings.ViewModel)
}


class DriverStandingsViewController: UITableViewController, DriverStandingsDisplayLogic {
    
    var interactor: DriverStandingsBusinessLogic?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch()
    }
    
    func fetch() {
        let request = DriverStandings.FetchDriverStandings.Request(year: "2018")
        interactor?.fetchDriverStandings(request: request)
    }
    
    func displayDriverStandings(viewModel: DriverStandings.FetchDriverStandings.ViewModel) {
        let driverStandings = viewModel.displayedDriverStanding
        for driverStanding in driverStandings {
            print(driverStanding.familyName ?? "family" + "\n")
            print(driverStanding.givenName ?? "givenName" + "\n")
            print(driverStanding.positionText ?? "positionText" + "\n")
        }
    }
    
    func setup() {
        let viewController = self
        let interactor = DriverStandingsInteractor()
        let presenter = DriverStandingsPresenter()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        viewController.interactor = interactor
        
        
    }
}
