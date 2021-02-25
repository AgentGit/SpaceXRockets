//
//  Endpoint.swift
//  SpaceXRockets
//
//  Created by Chad Goodyear on 25/2/21.
//

import Foundation

enum Endpoint: String {
    case rockets = "rockets"
}

// https://github.com/r-spacex/SpaceX-API/tree/master/docs/v4
//Get all rockets : GET /rockets
//Get one rocket : GET /rockets/:id
//Query rockets : POST /rockets/query
