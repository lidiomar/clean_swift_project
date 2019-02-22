//
//  DriverStandingsModels.swift
//  f1Project
//
//  Created by Lidiomar Fernando Machado on 21/02/19.
//  Copyright © 2019 Lidiomar Fernando Machado. All rights reserved.
//

import Foundation

enum DriverStandings {
    
    enum FetchDriverStandings {
        
        struct Response {
            var driverStandings: [DriverStanding]
        }
        
        struct Request {
            var year: String
        }
        
        struct ViewModel {
        
            var displayedDriverStanding: [DriverPresentation]
            
        }
        
    }
    
}
