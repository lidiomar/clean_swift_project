//
//  StandingsList.swift
//  f1Project
//
//  Created by Lidiomar Fernando Machado on 22/02/19.
//  Copyright © 2019 Lidiomar Fernando Machado. All rights reserved.
//

struct StandingsList: Codable {
    let season: String?
    let round:String?
    let DriverStandings: [DriverStanding]?

}
