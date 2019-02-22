//
//  DriverStandingsWorker.swift
//  f1Project
//
//  Created by Lidiomar Fernando Machado on 22/02/19.
//  Copyright © 2019 Lidiomar Fernando Machado. All rights reserved.
//

import UIKit

protocol DriverStandingsWorkerProtocol {
    func fetchDriverStandings(request: DriverStandings.FetchDriverStandings.Request, completionHandler: @escaping (DriverStandings.FetchDriverStandings.Response) -> Void )
}


class DriverStandingsWorker: DriverStandingsWorkerProtocol {
    
    func fetchDriverStandings(request: DriverStandings.FetchDriverStandings.Request, completionHandler: @escaping (DriverStandings.FetchDriverStandings.Response) -> Void) {
        self.getStandingsFor(yearOfSeason: request.year, completionHandler: completionHandler)
    }
    
    
    func getStandingsFor(yearOfSeason year: String = "current", completionHandler: @escaping(DriverStandings.FetchDriverStandings.Response) -> Void) {
        
        let address = "https://ergast.com/api/f1/\(year)/driverStandings.json"
        let url = URL(string: address)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data, urlResponse, error) in
            if let dateReturned = data {
                let decoder = JSONDecoder()
                do {
                    let obj = try decoder.decode(BaseObject.self, from: dateReturned)
                    let driverStandings: [DriverStanding] = obj.MRData?.StandingsTable.StandingsLists?.first?.DriverStandings ?? []
                    let response = DriverStandings.FetchDriverStandings.Response(driverStandings: driverStandings)
                    completionHandler(response)
                }catch let error {
                    print("Erro \(error)")
                }
            }
        }
        task.resume()
    }
}
