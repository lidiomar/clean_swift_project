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
   
    @IBOutlet var tableViewStandings: UITableView!
    var driverStandings: [DriverPresentation] = []
    
    override func viewDidLoad() {
        tableViewStandings.delegate = self
        tableViewStandings.dataSource = self
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
        driverStandings = viewModel.displayedDriverStanding
        DispatchQueue.main.async {
            self.tableViewStandings.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return driverStandings.count  
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        cell.textLabel?.text = driverStandings[indexPath.row].familyName
        
        return cell
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
